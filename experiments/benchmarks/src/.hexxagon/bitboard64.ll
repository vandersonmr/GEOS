; ModuleID = 'bitboard64.cpp'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%class.BitBoard64 = type { i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@_ZSt4cout = external global %"class.std::basic_ostream"
@.str = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"x \00", align 1
@.str2 = private unnamed_addr constant [3 x i8] c". \00", align 1
@.str3 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@__llvm_gcov_ctr = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr4 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr5 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr6 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr7 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr8 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr9 = internal global [5 x i64] zeroinitializer
@__llvm_gcov_ctr10 = internal global [11 x i64] zeroinitializer
@__llvm_gcov_ctr11 = internal global [11 x i64] zeroinitializer
@__llvm_gcov_ctr12 = internal global [11 x i64] zeroinitializer
@__llvm_gcov_ctr13 = internal global [19 x i64] zeroinitializer
@__llvm_gcov_ctr14 = internal global [19 x i64] zeroinitializer
@__llvm_gcov_ctr15 = internal global [48 x i64] zeroinitializer
@__llvm_gcov_ctr16 = internal global [28 x i64] zeroinitializer
@__llvm_gcov_ctr17 = internal global [2 x i64] zeroinitializer
@0 = private unnamed_addr constant [5 x i8] c"*204\00"
@1 = private unnamed_addr constant [92 x i8] c"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.gcda\00"
@2 = private unnamed_addr constant [22 x i8] c"__cxx_global_var_init\00"
@3 = private unnamed_addr constant [20 x i8] c"_ZN10BitBoard64coEv\00"
@4 = private unnamed_addr constant [23 x i8] c"_ZN10BitBoard64anERKS_\00"
@5 = private unnamed_addr constant [23 x i8] c"_ZN10BitBoard64orERKS_\00"
@6 = private unnamed_addr constant [23 x i8] c"_ZN10BitBoard64aSERKS_\00"
@7 = private unnamed_addr constant [23 x i8] c"_ZN10BitBoard64eoERKS_\00"
@8 = private unnamed_addr constant [21 x i8] c"_ZN10BitBoard64cvbEv\00"
@9 = private unnamed_addr constant [25 x i8] c"_ZN10BitBoard646setBitEi\00"
@10 = private unnamed_addr constant [27 x i8] c"_ZN10BitBoard648unSetBitEi\00"
@11 = private unnamed_addr constant [25 x i8] c"_ZN10BitBoard646getBitEi\00"
@12 = private unnamed_addr constant [41 x i8] c"_ZN10BitBoard6412readFromFileEP8_IO_FILE\00"
@13 = private unnamed_addr constant [40 x i8] c"_ZN10BitBoard6411writeToFileEP8_IO_FILE\00"
@14 = private unnamed_addr constant [12 x i8] c"_Z6getBFPii\00"
@15 = private unnamed_addr constant [24 x i8] c"_ZN10BitBoard645printEv\00"
@16 = private unnamed_addr constant [21 x i8] c"_ZN10BitBoard64C2Ejj\00"
@llvm.global_ctors = appending global [2 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_bitboard64.cpp, i8* null }, { i32, void ()*, i8* } { i32 0, void ()* @__llvm_gcov_init, i8* null }]

define internal void @__cxx_global_var_init() section ".text.startup" {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr, i64 0, i64 0)
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr, i64 0, i64 1), !dbg !531
  %4 = add i64 %3, 1, !dbg !531
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr, i64 0, i64 1), !dbg !531
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit), !dbg !531
  %5 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #1, !dbg !531
  ret void, !dbg !531
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) #0

declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) #0

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #1

; Function Attrs: uwtable
define i64 @_ZN10BitBoard64coEv(%class.BitBoard64* %this) #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr4, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr4, i64 0, i64 0)
  %retval = alloca %class.BitBoard64, align 4
  %this.addr = alloca %class.BitBoard64*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr4, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr4, i64 0, i64 1)
  store %class.BitBoard64* %this, %class.BitBoard64** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.BitBoard64** %this.addr, metadata !532, metadata !534), !dbg !535
  %this1 = load %class.BitBoard64** %this.addr
  call void @llvm.dbg.declare(metadata %class.BitBoard64* %retval, metadata !536, metadata !534), !dbg !537
  %lowbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 0, !dbg !538
  %5 = load i32* %lowbits, align 4, !dbg !538
  %neg = xor i32 %5, -1, !dbg !539
  %highbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 1, !dbg !540
  %6 = load i32* %highbits, align 4, !dbg !540
  %neg2 = xor i32 %6, -1, !dbg !541
  call void @_ZN10BitBoard64C2Ejj(%class.BitBoard64* %retval, i32 %neg, i32 %neg2), !dbg !537
  %7 = bitcast %class.BitBoard64* %retval to i64*, !dbg !542
  %8 = load i64* %7, align 1, !dbg !542
  ret i64 %8, !dbg !542
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN10BitBoard64C2Ejj(%class.BitBoard64* %this, i32 %l, i32 %h) unnamed_addr #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr17, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr17, i64 0, i64 0)
  %this.addr = alloca %class.BitBoard64*, align 8
  %l.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr17, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr17, i64 0, i64 1)
  store %class.BitBoard64* %this, %class.BitBoard64** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.BitBoard64** %this.addr, metadata !543, metadata !534), !dbg !544
  store i32 %l, i32* %l.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %l.addr, metadata !545, metadata !534), !dbg !547
  store i32 %h, i32* %h.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %h.addr, metadata !548, metadata !534), !dbg !549
  %this1 = load %class.BitBoard64** %this.addr
  %5 = load i32* %l.addr, align 4, !dbg !550
  %lowbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 0, !dbg !552
  store i32 %5, i32* %lowbits, align 4, !dbg !552
  %6 = load i32* %h.addr, align 4, !dbg !553
  %highbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 1, !dbg !552
  store i32 %6, i32* %highbits, align 4, !dbg !552
  ret void, !dbg !554
}

; Function Attrs: uwtable
define i64 @_ZN10BitBoard64anERKS_(%class.BitBoard64* %this, %class.BitBoard64* dereferenceable(8) %right) #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr5, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr5, i64 0, i64 0)
  %retval = alloca %class.BitBoard64, align 4
  %this.addr = alloca %class.BitBoard64*, align 8
  %right.addr = alloca %class.BitBoard64*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr5, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr5, i64 0, i64 1)
  store %class.BitBoard64* %this, %class.BitBoard64** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.BitBoard64** %this.addr, metadata !555, metadata !534), !dbg !556
  store %class.BitBoard64* %right, %class.BitBoard64** %right.addr, align 8
  call void @llvm.dbg.declare(metadata %class.BitBoard64** %right.addr, metadata !557, metadata !534), !dbg !558
  %this1 = load %class.BitBoard64** %this.addr
  call void @llvm.dbg.declare(metadata %class.BitBoard64* %retval, metadata !559, metadata !534), !dbg !560
  %lowbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 0, !dbg !561
  %5 = load i32* %lowbits, align 4, !dbg !561
  %6 = load %class.BitBoard64** %right.addr, align 8, !dbg !562
  %lowbits2 = getelementptr inbounds %class.BitBoard64* %6, i32 0, i32 0, !dbg !562
  %7 = load i32* %lowbits2, align 4, !dbg !562
  %and = and i32 %5, %7, !dbg !561
  %highbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 1, !dbg !563
  %8 = load i32* %highbits, align 4, !dbg !563
  %9 = load %class.BitBoard64** %right.addr, align 8, !dbg !564
  %highbits3 = getelementptr inbounds %class.BitBoard64* %9, i32 0, i32 1, !dbg !564
  %10 = load i32* %highbits3, align 4, !dbg !564
  %and4 = and i32 %8, %10, !dbg !563
  call void @_ZN10BitBoard64C2Ejj(%class.BitBoard64* %retval, i32 %and, i32 %and4), !dbg !560
  %11 = bitcast %class.BitBoard64* %retval to i64*, !dbg !565
  %12 = load i64* %11, align 1, !dbg !565
  ret i64 %12, !dbg !565
}

; Function Attrs: uwtable
define i64 @_ZN10BitBoard64orERKS_(%class.BitBoard64* %this, %class.BitBoard64* dereferenceable(8) %right) #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr6, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr6, i64 0, i64 0)
  %retval = alloca %class.BitBoard64, align 4
  %this.addr = alloca %class.BitBoard64*, align 8
  %right.addr = alloca %class.BitBoard64*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr6, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr6, i64 0, i64 1)
  store %class.BitBoard64* %this, %class.BitBoard64** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.BitBoard64** %this.addr, metadata !566, metadata !534), !dbg !567
  store %class.BitBoard64* %right, %class.BitBoard64** %right.addr, align 8
  call void @llvm.dbg.declare(metadata %class.BitBoard64** %right.addr, metadata !568, metadata !534), !dbg !569
  %this1 = load %class.BitBoard64** %this.addr
  call void @llvm.dbg.declare(metadata %class.BitBoard64* %retval, metadata !570, metadata !534), !dbg !571
  %lowbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 0, !dbg !572
  %5 = load i32* %lowbits, align 4, !dbg !572
  %6 = load %class.BitBoard64** %right.addr, align 8, !dbg !573
  %lowbits2 = getelementptr inbounds %class.BitBoard64* %6, i32 0, i32 0, !dbg !573
  %7 = load i32* %lowbits2, align 4, !dbg !573
  %or = or i32 %5, %7, !dbg !572
  %highbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 1, !dbg !574
  %8 = load i32* %highbits, align 4, !dbg !574
  %9 = load %class.BitBoard64** %right.addr, align 8, !dbg !575
  %highbits3 = getelementptr inbounds %class.BitBoard64* %9, i32 0, i32 1, !dbg !575
  %10 = load i32* %highbits3, align 4, !dbg !575
  %or4 = or i32 %8, %10, !dbg !574
  call void @_ZN10BitBoard64C2Ejj(%class.BitBoard64* %retval, i32 %or, i32 %or4), !dbg !571
  %11 = bitcast %class.BitBoard64* %retval to i64*, !dbg !576
  %12 = load i64* %11, align 1, !dbg !576
  ret i64 %12, !dbg !576
}

; Function Attrs: nounwind uwtable
define i64 @_ZN10BitBoard64aSERKS_(%class.BitBoard64* %this, %class.BitBoard64* dereferenceable(8) %right) #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr7, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr7, i64 0, i64 0)
  %retval = alloca %class.BitBoard64, align 4
  %this.addr = alloca %class.BitBoard64*, align 8
  %right.addr = alloca %class.BitBoard64*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr7, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr7, i64 0, i64 1)
  store %class.BitBoard64* %this, %class.BitBoard64** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.BitBoard64** %this.addr, metadata !577, metadata !534), !dbg !578
  store %class.BitBoard64* %right, %class.BitBoard64** %right.addr, align 8
  call void @llvm.dbg.declare(metadata %class.BitBoard64** %right.addr, metadata !579, metadata !534), !dbg !580
  %this1 = load %class.BitBoard64** %this.addr
  %5 = load %class.BitBoard64** %right.addr, align 8, !dbg !581
  %lowbits = getelementptr inbounds %class.BitBoard64* %5, i32 0, i32 0, !dbg !581
  %6 = load i32* %lowbits, align 4, !dbg !581
  %lowbits2 = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 0, !dbg !582
  store i32 %6, i32* %lowbits2, align 4, !dbg !582
  %7 = load %class.BitBoard64** %right.addr, align 8, !dbg !583
  %highbits = getelementptr inbounds %class.BitBoard64* %7, i32 0, i32 1, !dbg !583
  %8 = load i32* %highbits, align 4, !dbg !583
  %highbits3 = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 1, !dbg !584
  store i32 %8, i32* %highbits3, align 4, !dbg !584
  %9 = bitcast %class.BitBoard64* %retval to i8*, !dbg !585
  %10 = bitcast %class.BitBoard64* %this1 to i8*, !dbg !585
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 8, i32 4, i1 false), !dbg !585
  %11 = bitcast %class.BitBoard64* %retval to i64*, !dbg !585
  %12 = load i64* %11, align 1, !dbg !585
  ret i64 %12, !dbg !585
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: uwtable
define i64 @_ZN10BitBoard64eoERKS_(%class.BitBoard64* %this, %class.BitBoard64* dereferenceable(8) %right) #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr8, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr8, i64 0, i64 0)
  %retval = alloca %class.BitBoard64, align 4
  %this.addr = alloca %class.BitBoard64*, align 8
  %right.addr = alloca %class.BitBoard64*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr8, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr8, i64 0, i64 1)
  store %class.BitBoard64* %this, %class.BitBoard64** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.BitBoard64** %this.addr, metadata !586, metadata !534), !dbg !587
  store %class.BitBoard64* %right, %class.BitBoard64** %right.addr, align 8
  call void @llvm.dbg.declare(metadata %class.BitBoard64** %right.addr, metadata !588, metadata !534), !dbg !589
  %this1 = load %class.BitBoard64** %this.addr
  call void @llvm.dbg.declare(metadata %class.BitBoard64* %retval, metadata !590, metadata !534), !dbg !591
  %lowbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 0, !dbg !592
  %5 = load i32* %lowbits, align 4, !dbg !592
  %6 = load %class.BitBoard64** %right.addr, align 8, !dbg !593
  %lowbits2 = getelementptr inbounds %class.BitBoard64* %6, i32 0, i32 0, !dbg !593
  %7 = load i32* %lowbits2, align 4, !dbg !593
  %xor = xor i32 %5, %7, !dbg !592
  %highbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 1, !dbg !594
  %8 = load i32* %highbits, align 4, !dbg !594
  %9 = load %class.BitBoard64** %right.addr, align 8, !dbg !595
  %highbits3 = getelementptr inbounds %class.BitBoard64* %9, i32 0, i32 1, !dbg !595
  %10 = load i32* %highbits3, align 4, !dbg !595
  %xor4 = xor i32 %8, %10, !dbg !594
  call void @_ZN10BitBoard64C2Ejj(%class.BitBoard64* %retval, i32 %xor, i32 %xor4), !dbg !591
  %11 = bitcast %class.BitBoard64* %retval to i64*, !dbg !596
  %12 = load i64* %11, align 1, !dbg !596
  ret i64 %12, !dbg !596
}

; Function Attrs: nounwind uwtable
define zeroext i1 @_ZN10BitBoard64cvbEv(%class.BitBoard64* %this) #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr9, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr9, i64 0, i64 0)
  %this.addr = alloca %class.BitBoard64*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.BitBoard64* %this, %class.BitBoard64** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.BitBoard64** %this.addr, metadata !597, metadata !534), !dbg !598
  %this1 = load %class.BitBoard64** %this.addr
  %lowbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 0, !dbg !599
  %3 = load i32* %lowbits, align 4, !dbg !599
  %tobool = icmp ne i32 %3, 0, !dbg !599
  %4 = select i1 %tobool, i64 1, i64 2, !dbg !599
  %5 = getelementptr inbounds [5 x i64]* @__llvm_gcov_ctr9, i64 0, i64 %4, !dbg !599
  %6 = load i64* %5, !dbg !599
  %7 = add i64 %6, 1, !dbg !599
  store i64 %7, i64* %5, !dbg !599
  br i1 %tobool, label %lor.end, label %lor.rhs, !dbg !599

lor.rhs:                                          ; preds = %2
  %8 = load i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr9, i64 0, i64 3), !dbg !600
  %9 = add i64 %8, 1, !dbg !600
  store i64 %9, i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr9, i64 0, i64 3), !dbg !600
  %highbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 1, !dbg !600
  %10 = load i32* %highbits, align 4, !dbg !600
  %tobool2 = icmp ne i32 %10, 0, !dbg !600
  br label %lor.end, !dbg !599

lor.end:                                          ; preds = %lor.rhs, %2
  %11 = phi i1 [ true, %2 ], [ %tobool2, %lor.rhs ]
  %12 = load i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr9, i64 0, i64 4), !dbg !602
  %13 = add i64 %12, 1, !dbg !602
  store i64 %13, i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr9, i64 0, i64 4), !dbg !602
  ret i1 %11, !dbg !602
}

; Function Attrs: nounwind uwtable
define void @_ZN10BitBoard646setBitEi(%class.BitBoard64* %this, i32 %bit) #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr10, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr10, i64 0, i64 0)
  %this.addr = alloca %class.BitBoard64*, align 8
  %bit.addr = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.BitBoard64* %this, %class.BitBoard64** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.BitBoard64** %this.addr, metadata !605, metadata !534), !dbg !606
  store i32 %bit, i32* %bit.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %bit.addr, metadata !607, metadata !534), !dbg !608
  %this1 = load %class.BitBoard64** %this.addr
  %3 = load i32* %bit.addr, align 4, !dbg !609
  %cmp = icmp slt i32 %3, 0, !dbg !609
  %4 = select i1 %cmp, i64 1, i64 2, !dbg !611
  %5 = getelementptr inbounds [11 x i64]* @__llvm_gcov_ctr10, i64 0, i64 %4, !dbg !611
  %6 = load i64* %5, !dbg !611
  %7 = add i64 %6, 1, !dbg !611
  store i64 %7, i64* %5, !dbg !611
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !611

lor.lhs.false:                                    ; preds = %2
  %8 = load i32* %bit.addr, align 4, !dbg !612
  %cmp2 = icmp sgt i32 %8, 63, !dbg !612
  %9 = select i1 %cmp2, i64 3, i64 4, !dbg !611
  %10 = getelementptr inbounds [11 x i64]* @__llvm_gcov_ctr10, i64 0, i64 %9, !dbg !611
  %11 = load i64* %10, !dbg !611
  %12 = add i64 %11, 1, !dbg !611
  store i64 %12, i64* %10, !dbg !611
  br i1 %cmp2, label %if.then, label %if.end, !dbg !611

if.then:                                          ; preds = %lor.lhs.false, %2
  %13 = load i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr10, i64 0, i64 5), !dbg !614
  %14 = add i64 %13, 1, !dbg !614
  store i64 %14, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr10, i64 0, i64 5), !dbg !614
  br label %if.end7, !dbg !614

if.end:                                           ; preds = %lor.lhs.false
  %15 = load i32* %bit.addr, align 4, !dbg !615
  %cmp3 = icmp slt i32 %15, 32, !dbg !615
  %16 = select i1 %cmp3, i64 6, i64 7, !dbg !617
  %17 = getelementptr inbounds [11 x i64]* @__llvm_gcov_ctr10, i64 0, i64 %16, !dbg !617
  %18 = load i64* %17, !dbg !617
  %19 = add i64 %18, 1, !dbg !617
  store i64 %19, i64* %17, !dbg !617
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !617

if.then4:                                         ; preds = %if.end
  %20 = load i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr10, i64 0, i64 8), !dbg !618
  %21 = add i64 %20, 1, !dbg !618
  store i64 %21, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr10, i64 0, i64 8), !dbg !618
  %22 = load i32* %bit.addr, align 4, !dbg !618
  %shl = shl i32 1, %22, !dbg !619
  %lowbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 0, !dbg !620
  %23 = load i32* %lowbits, align 4, !dbg !620
  %or = or i32 %23, %shl, !dbg !620
  store i32 %or, i32* %lowbits, align 4, !dbg !620
  br label %if.end7, !dbg !620

if.else:                                          ; preds = %if.end
  %24 = load i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr10, i64 0, i64 9), !dbg !621
  %25 = add i64 %24, 1, !dbg !621
  store i64 %25, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr10, i64 0, i64 9), !dbg !621
  %26 = load i32* %bit.addr, align 4, !dbg !621
  %sub = sub nsw i32 %26, 32, !dbg !621
  %shl5 = shl i32 1, %sub, !dbg !622
  %highbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 1, !dbg !623
  %27 = load i32* %highbits, align 4, !dbg !623
  %or6 = or i32 %27, %shl5, !dbg !623
  store i32 %or6, i32* %highbits, align 4, !dbg !623
  br label %if.end7

if.end7:                                          ; preds = %if.then, %if.else, %if.then4
  %28 = load i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr10, i64 0, i64 10), !dbg !624
  %29 = add i64 %28, 1, !dbg !624
  store i64 %29, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr10, i64 0, i64 10), !dbg !624
  ret void, !dbg !624
}

; Function Attrs: nounwind uwtable
define void @_ZN10BitBoard648unSetBitEi(%class.BitBoard64* %this, i32 %bit) #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr11, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr11, i64 0, i64 0)
  %this.addr = alloca %class.BitBoard64*, align 8
  %bit.addr = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.BitBoard64* %this, %class.BitBoard64** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.BitBoard64** %this.addr, metadata !625, metadata !534), !dbg !626
  store i32 %bit, i32* %bit.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %bit.addr, metadata !627, metadata !534), !dbg !628
  %this1 = load %class.BitBoard64** %this.addr
  %3 = load i32* %bit.addr, align 4, !dbg !629
  %cmp = icmp slt i32 %3, 0, !dbg !629
  %4 = select i1 %cmp, i64 1, i64 2, !dbg !631
  %5 = getelementptr inbounds [11 x i64]* @__llvm_gcov_ctr11, i64 0, i64 %4, !dbg !631
  %6 = load i64* %5, !dbg !631
  %7 = add i64 %6, 1, !dbg !631
  store i64 %7, i64* %5, !dbg !631
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !631

lor.lhs.false:                                    ; preds = %2
  %8 = load i32* %bit.addr, align 4, !dbg !632
  %cmp2 = icmp sgt i32 %8, 63, !dbg !632
  %9 = select i1 %cmp2, i64 3, i64 4, !dbg !631
  %10 = getelementptr inbounds [11 x i64]* @__llvm_gcov_ctr11, i64 0, i64 %9, !dbg !631
  %11 = load i64* %10, !dbg !631
  %12 = add i64 %11, 1, !dbg !631
  store i64 %12, i64* %10, !dbg !631
  br i1 %cmp2, label %if.then, label %if.end, !dbg !631

if.then:                                          ; preds = %lor.lhs.false, %2
  %13 = load i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr11, i64 0, i64 5), !dbg !634
  %14 = add i64 %13, 1, !dbg !634
  store i64 %14, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr11, i64 0, i64 5), !dbg !634
  br label %if.end8, !dbg !634

if.end:                                           ; preds = %lor.lhs.false
  %15 = load i32* %bit.addr, align 4, !dbg !635
  %cmp3 = icmp slt i32 %15, 32, !dbg !635
  %16 = select i1 %cmp3, i64 6, i64 7, !dbg !637
  %17 = getelementptr inbounds [11 x i64]* @__llvm_gcov_ctr11, i64 0, i64 %16, !dbg !637
  %18 = load i64* %17, !dbg !637
  %19 = add i64 %18, 1, !dbg !637
  store i64 %19, i64* %17, !dbg !637
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !637

if.then4:                                         ; preds = %if.end
  %20 = load i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr11, i64 0, i64 8), !dbg !638
  %21 = add i64 %20, 1, !dbg !638
  store i64 %21, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr11, i64 0, i64 8), !dbg !638
  %22 = load i32* %bit.addr, align 4, !dbg !638
  %shl = shl i32 1, %22, !dbg !639
  %neg = xor i32 %shl, -1, !dbg !640
  %lowbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 0, !dbg !641
  %23 = load i32* %lowbits, align 4, !dbg !641
  %and = and i32 %23, %neg, !dbg !641
  store i32 %and, i32* %lowbits, align 4, !dbg !641
  br label %if.end8, !dbg !641

if.else:                                          ; preds = %if.end
  %24 = load i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr11, i64 0, i64 9), !dbg !642
  %25 = add i64 %24, 1, !dbg !642
  store i64 %25, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr11, i64 0, i64 9), !dbg !642
  %26 = load i32* %bit.addr, align 4, !dbg !642
  %sub = sub nsw i32 %26, 32, !dbg !642
  %shl5 = shl i32 1, %sub, !dbg !643
  %neg6 = xor i32 %shl5, -1, !dbg !644
  %highbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 1, !dbg !645
  %27 = load i32* %highbits, align 4, !dbg !645
  %and7 = and i32 %27, %neg6, !dbg !645
  store i32 %and7, i32* %highbits, align 4, !dbg !645
  br label %if.end8

if.end8:                                          ; preds = %if.then, %if.else, %if.then4
  %28 = load i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr11, i64 0, i64 10), !dbg !646
  %29 = add i64 %28, 1, !dbg !646
  store i64 %29, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr11, i64 0, i64 10), !dbg !646
  ret void, !dbg !646
}

; Function Attrs: nounwind uwtable
define i32 @_ZN10BitBoard646getBitEi(%class.BitBoard64* %this, i32 %bit) #4 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr12, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr12, i64 0, i64 0)
  %retval = alloca i32, align 4
  %this.addr = alloca %class.BitBoard64*, align 8
  %bit.addr = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.BitBoard64* %this, %class.BitBoard64** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.BitBoard64** %this.addr, metadata !647, metadata !534), !dbg !648
  store i32 %bit, i32* %bit.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %bit.addr, metadata !649, metadata !534), !dbg !650
  %this1 = load %class.BitBoard64** %this.addr
  %3 = load i32* %bit.addr, align 4, !dbg !651
  %cmp = icmp slt i32 %3, 0, !dbg !651
  %4 = select i1 %cmp, i64 1, i64 2, !dbg !653
  %5 = getelementptr inbounds [11 x i64]* @__llvm_gcov_ctr12, i64 0, i64 %4, !dbg !653
  %6 = load i64* %5, !dbg !653
  %7 = add i64 %6, 1, !dbg !653
  store i64 %7, i64* %5, !dbg !653
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !653

lor.lhs.false:                                    ; preds = %2
  %8 = load i32* %bit.addr, align 4, !dbg !654
  %cmp2 = icmp sgt i32 %8, 63, !dbg !654
  %9 = select i1 %cmp2, i64 3, i64 4, !dbg !653
  %10 = getelementptr inbounds [11 x i64]* @__llvm_gcov_ctr12, i64 0, i64 %9, !dbg !653
  %11 = load i64* %10, !dbg !653
  %12 = add i64 %11, 1, !dbg !653
  store i64 %12, i64* %10, !dbg !653
  br i1 %cmp2, label %if.then, label %if.end, !dbg !653

if.then:                                          ; preds = %lor.lhs.false, %2
  %13 = load i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr12, i64 0, i64 5), !dbg !656
  %14 = add i64 %13, 1, !dbg !656
  store i64 %14, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr12, i64 0, i64 5), !dbg !656
  store i32 -1, i32* %retval, !dbg !656
  br label %return, !dbg !656

if.end:                                           ; preds = %lor.lhs.false
  %15 = load i32* %bit.addr, align 4, !dbg !657
  %cmp3 = icmp slt i32 %15, 32, !dbg !657
  %16 = select i1 %cmp3, i64 6, i64 7, !dbg !659
  %17 = getelementptr inbounds [11 x i64]* @__llvm_gcov_ctr12, i64 0, i64 %16, !dbg !659
  %18 = load i64* %17, !dbg !659
  %19 = add i64 %18, 1, !dbg !659
  store i64 %19, i64* %17, !dbg !659
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !659

if.then4:                                         ; preds = %if.end
  %20 = load i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr12, i64 0, i64 8), !dbg !660
  %21 = add i64 %20, 1, !dbg !660
  store i64 %21, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr12, i64 0, i64 8), !dbg !660
  %lowbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 0, !dbg !660
  %22 = load i32* %lowbits, align 4, !dbg !660
  %23 = load i32* %bit.addr, align 4, !dbg !661
  %shl = shl i32 1, %23, !dbg !662
  %and = and i32 %22, %shl, !dbg !660
  store i32 %and, i32* %retval, !dbg !663
  br label %return, !dbg !663

if.else:                                          ; preds = %if.end
  %24 = load i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr12, i64 0, i64 9), !dbg !664
  %25 = add i64 %24, 1, !dbg !664
  store i64 %25, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr12, i64 0, i64 9), !dbg !664
  %highbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 1, !dbg !664
  %26 = load i32* %highbits, align 4, !dbg !664
  %27 = load i32* %bit.addr, align 4, !dbg !665
  %sub = sub nsw i32 %27, 32, !dbg !665
  %shl5 = shl i32 1, %sub, !dbg !666
  %and6 = and i32 %26, %shl5, !dbg !664
  store i32 %and6, i32* %retval, !dbg !667
  br label %return, !dbg !667

return:                                           ; preds = %if.else, %if.then4, %if.then
  %28 = load i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr12, i64 0, i64 10), !dbg !668
  %29 = add i64 %28, 1, !dbg !668
  store i64 %29, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr12, i64 0, i64 10), !dbg !668
  %30 = load i32* %retval, !dbg !668
  ret i32 %30, !dbg !668
}

; Function Attrs: uwtable
define i32 @_ZN10BitBoard6412readFromFileEP8_IO_FILE(%class.BitBoard64* %this, %struct._IO_FILE* %file) #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 0)
  %retval = alloca i32, align 4
  %this.addr = alloca %class.BitBoard64*, align 8
  %file.addr = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  %byte = alloca i8, align 1
  %i4 = alloca i32, align 4
  %byte8 = alloca i8, align 1
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 1)
  store %class.BitBoard64* %this, %class.BitBoard64** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.BitBoard64** %this.addr, metadata !669, metadata !534), !dbg !670
  store %struct._IO_FILE* %file, %struct._IO_FILE** %file.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %file.addr, metadata !671, metadata !534), !dbg !672
  %this1 = load %class.BitBoard64** %this.addr
  %lowbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 0, !dbg !673
  store i32 0, i32* %lowbits, align 4, !dbg !673
  %highbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 1, !dbg !674
  store i32 0, i32* %highbits, align 4, !dbg !674
  call void @llvm.dbg.declare(metadata i32* %i, metadata !675, metadata !534), !dbg !677
  store i32 0, i32* %i, align 4, !dbg !677
  br label %for.cond, !dbg !678

for.cond:                                         ; preds = %for.inc, %2
  %5 = load i32* %i, align 4, !dbg !679
  %cmp = icmp slt i32 %5, 4, !dbg !679
  %6 = select i1 %cmp, i64 2, i64 3, !dbg !683
  %7 = getelementptr inbounds [19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 %6, !dbg !683
  %8 = load i64* %7, !dbg !683
  %9 = add i64 %8, 1, !dbg !683
  store i64 %9, i64* %7, !dbg !683
  br i1 %cmp, label %for.body, label %for.end, !dbg !683

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i8* %byte, metadata !684, metadata !534), !dbg !688
  store i8 0, i8* %byte, align 1, !dbg !688
  %10 = load %struct._IO_FILE** %file.addr, align 8, !dbg !689
  %call = call i64 @fread(i8* %byte, i64 1, i64 1, %struct._IO_FILE* %10), !dbg !691
  %cmp2 = icmp ne i64 %call, 1, !dbg !691
  %11 = select i1 %cmp2, i64 4, i64 5, !dbg !692
  %12 = getelementptr inbounds [19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 %11, !dbg !692
  %13 = load i64* %12, !dbg !692
  %14 = add i64 %13, 1, !dbg !692
  store i64 %14, i64* %12, !dbg !692
  br i1 %cmp2, label %if.then, label %if.end, !dbg !692

if.then:                                          ; preds = %for.body
  %15 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 6), !dbg !693
  %16 = add i64 %15, 1, !dbg !693
  store i64 %16, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 6), !dbg !693
  store i32 -1, i32* %retval, !dbg !693
  br label %return, !dbg !693

if.end:                                           ; preds = %for.body
  %17 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 7), !dbg !694
  %18 = add i64 %17, 1, !dbg !694
  store i64 %18, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 7), !dbg !694
  %19 = load i8* %byte, align 1, !dbg !694
  %conv = zext i8 %19 to i32, !dbg !694
  %20 = load i32* %i, align 4, !dbg !695
  %mul = mul nsw i32 %20, 8, !dbg !695
  %shl = shl i32 %conv, %mul, !dbg !694
  %lowbits3 = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 0, !dbg !696
  %21 = load i32* %lowbits3, align 4, !dbg !696
  %or = or i32 %21, %shl, !dbg !696
  store i32 %or, i32* %lowbits3, align 4, !dbg !696
  br label %for.inc, !dbg !697

for.inc:                                          ; preds = %if.end
  %22 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 8), !dbg !698
  %23 = add i64 %22, 1, !dbg !698
  store i64 %23, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 8), !dbg !698
  %24 = load i32* %i, align 4, !dbg !698
  %inc = add nsw i32 %24, 1, !dbg !698
  store i32 %inc, i32* %i, align 4, !dbg !698
  br label %for.cond, !dbg !699

for.end:                                          ; preds = %for.cond
  %25 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 9), !dbg !700
  %26 = add i64 %25, 1, !dbg !700
  store i64 %26, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 9), !dbg !700
  call void @llvm.dbg.declare(metadata i32* %i4, metadata !702, metadata !534), !dbg !700
  store i32 0, i32* %i4, align 4, !dbg !700
  br label %for.cond5, !dbg !703

for.cond5:                                        ; preds = %for.inc18, %for.end
  %27 = load i32* %i4, align 4, !dbg !704
  %cmp6 = icmp slt i32 %27, 4, !dbg !704
  %28 = select i1 %cmp6, i64 10, i64 11, !dbg !708
  %29 = getelementptr inbounds [19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 %28, !dbg !708
  %30 = load i64* %29, !dbg !708
  %31 = add i64 %30, 1, !dbg !708
  store i64 %31, i64* %29, !dbg !708
  br i1 %cmp6, label %for.body7, label %for.end20, !dbg !708

for.body7:                                        ; preds = %for.cond5
  call void @llvm.dbg.declare(metadata i8* %byte8, metadata !709, metadata !534), !dbg !711
  store i8 0, i8* %byte8, align 1, !dbg !711
  %32 = load %struct._IO_FILE** %file.addr, align 8, !dbg !712
  %call9 = call i64 @fread(i8* %byte8, i64 1, i64 1, %struct._IO_FILE* %32), !dbg !714
  %cmp10 = icmp ne i64 %call9, 1, !dbg !714
  %33 = select i1 %cmp10, i64 12, i64 13, !dbg !715
  %34 = getelementptr inbounds [19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 %33, !dbg !715
  %35 = load i64* %34, !dbg !715
  %36 = add i64 %35, 1, !dbg !715
  store i64 %36, i64* %34, !dbg !715
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !715

if.then11:                                        ; preds = %for.body7
  %37 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 14), !dbg !716
  %38 = add i64 %37, 1, !dbg !716
  store i64 %38, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 14), !dbg !716
  store i32 -1, i32* %retval, !dbg !716
  br label %return, !dbg !716

if.end12:                                         ; preds = %for.body7
  %39 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 15), !dbg !717
  %40 = add i64 %39, 1, !dbg !717
  store i64 %40, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 15), !dbg !717
  %41 = load i8* %byte8, align 1, !dbg !717
  %conv13 = zext i8 %41 to i32, !dbg !717
  %42 = load i32* %i4, align 4, !dbg !718
  %mul14 = mul nsw i32 %42, 8, !dbg !718
  %shl15 = shl i32 %conv13, %mul14, !dbg !717
  %highbits16 = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 1, !dbg !719
  %43 = load i32* %highbits16, align 4, !dbg !719
  %or17 = or i32 %43, %shl15, !dbg !719
  store i32 %or17, i32* %highbits16, align 4, !dbg !719
  br label %for.inc18, !dbg !720

for.inc18:                                        ; preds = %if.end12
  %44 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 16), !dbg !721
  %45 = add i64 %44, 1, !dbg !721
  store i64 %45, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 16), !dbg !721
  %46 = load i32* %i4, align 4, !dbg !721
  %inc19 = add nsw i32 %46, 1, !dbg !721
  store i32 %inc19, i32* %i4, align 4, !dbg !721
  br label %for.cond5, !dbg !722

for.end20:                                        ; preds = %for.cond5
  %47 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 17), !dbg !723
  %48 = add i64 %47, 1, !dbg !723
  store i64 %48, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 17), !dbg !723
  store i32 0, i32* %retval, !dbg !723
  br label %return, !dbg !723

return:                                           ; preds = %for.end20, %if.then11, %if.then
  %49 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 18), !dbg !724
  %50 = add i64 %49, 1, !dbg !724
  store i64 %50, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 18), !dbg !724
  %51 = load i32* %retval, !dbg !724
  ret i32 %51, !dbg !724
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #0

; Function Attrs: uwtable
define i32 @_ZN10BitBoard6411writeToFileEP8_IO_FILE(%class.BitBoard64* %this, %struct._IO_FILE* %file) #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 0)
  %retval = alloca i32, align 4
  %this.addr = alloca %class.BitBoard64*, align 8
  %file.addr = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  %byte = alloca i8, align 1
  %i3 = alloca i32, align 4
  %byte7 = alloca i8, align 1
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 1)
  store %class.BitBoard64* %this, %class.BitBoard64** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.BitBoard64** %this.addr, metadata !725, metadata !534), !dbg !726
  store %struct._IO_FILE* %file, %struct._IO_FILE** %file.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %file.addr, metadata !727, metadata !534), !dbg !728
  %this1 = load %class.BitBoard64** %this.addr
  call void @llvm.dbg.declare(metadata i32* %i, metadata !729, metadata !534), !dbg !731
  store i32 0, i32* %i, align 4, !dbg !731
  br label %for.cond, !dbg !732

for.cond:                                         ; preds = %for.inc, %2
  %5 = load i32* %i, align 4, !dbg !733
  %cmp = icmp slt i32 %5, 4, !dbg !733
  %6 = select i1 %cmp, i64 2, i64 3, !dbg !737
  %7 = getelementptr inbounds [19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 %6, !dbg !737
  %8 = load i64* %7, !dbg !737
  %9 = add i64 %8, 1, !dbg !737
  store i64 %9, i64* %7, !dbg !737
  br i1 %cmp, label %for.body, label %for.end, !dbg !737

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i8* %byte, metadata !738, metadata !534), !dbg !740
  store i8 0, i8* %byte, align 1, !dbg !740
  %lowbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 0, !dbg !741
  %10 = load i32* %lowbits, align 4, !dbg !741
  %11 = load i32* %i, align 4, !dbg !742
  %mul = mul nsw i32 %11, 8, !dbg !742
  %shr = lshr i32 %10, %mul, !dbg !741
  %and = and i32 %shr, 255, !dbg !743
  %conv = trunc i32 %and to i8, !dbg !743
  store i8 %conv, i8* %byte, align 1, !dbg !744
  %12 = load %struct._IO_FILE** %file.addr, align 8, !dbg !745
  %call = call i64 @fwrite(i8* %byte, i64 1, i64 1, %struct._IO_FILE* %12), !dbg !747
  %cmp2 = icmp ne i64 %call, 1, !dbg !747
  %13 = select i1 %cmp2, i64 4, i64 5, !dbg !748
  %14 = getelementptr inbounds [19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 %13, !dbg !748
  %15 = load i64* %14, !dbg !748
  %16 = add i64 %15, 1, !dbg !748
  store i64 %16, i64* %14, !dbg !748
  br i1 %cmp2, label %if.then, label %if.end, !dbg !748

if.then:                                          ; preds = %for.body
  %17 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 6), !dbg !749
  %18 = add i64 %17, 1, !dbg !749
  store i64 %18, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 6), !dbg !749
  store i32 -1, i32* %retval, !dbg !749
  br label %return, !dbg !749

if.end:                                           ; preds = %for.body
  %19 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 7), !dbg !750
  %20 = add i64 %19, 1, !dbg !750
  store i64 %20, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 7), !dbg !750
  br label %for.inc, !dbg !750

for.inc:                                          ; preds = %if.end
  %21 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 8), !dbg !751
  %22 = add i64 %21, 1, !dbg !751
  store i64 %22, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 8), !dbg !751
  %23 = load i32* %i, align 4, !dbg !751
  %inc = add nsw i32 %23, 1, !dbg !751
  store i32 %inc, i32* %i, align 4, !dbg !751
  br label %for.cond, !dbg !752

for.end:                                          ; preds = %for.cond
  %24 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 9), !dbg !753
  %25 = add i64 %24, 1, !dbg !753
  store i64 %25, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 9), !dbg !753
  call void @llvm.dbg.declare(metadata i32* %i3, metadata !755, metadata !534), !dbg !753
  store i32 0, i32* %i3, align 4, !dbg !753
  br label %for.cond4, !dbg !756

for.cond4:                                        ; preds = %for.inc16, %for.end
  %26 = load i32* %i3, align 4, !dbg !757
  %cmp5 = icmp slt i32 %26, 4, !dbg !757
  %27 = select i1 %cmp5, i64 10, i64 11, !dbg !761
  %28 = getelementptr inbounds [19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 %27, !dbg !761
  %29 = load i64* %28, !dbg !761
  %30 = add i64 %29, 1, !dbg !761
  store i64 %30, i64* %28, !dbg !761
  br i1 %cmp5, label %for.body6, label %for.end18, !dbg !761

for.body6:                                        ; preds = %for.cond4
  call void @llvm.dbg.declare(metadata i8* %byte7, metadata !762, metadata !534), !dbg !764
  store i8 0, i8* %byte7, align 1, !dbg !764
  %highbits = getelementptr inbounds %class.BitBoard64* %this1, i32 0, i32 1, !dbg !765
  %31 = load i32* %highbits, align 4, !dbg !765
  %32 = load i32* %i3, align 4, !dbg !766
  %mul8 = mul nsw i32 %32, 8, !dbg !766
  %shr9 = lshr i32 %31, %mul8, !dbg !765
  %and10 = and i32 %shr9, 255, !dbg !767
  %conv11 = trunc i32 %and10 to i8, !dbg !767
  store i8 %conv11, i8* %byte7, align 1, !dbg !768
  %33 = load %struct._IO_FILE** %file.addr, align 8, !dbg !769
  %call12 = call i64 @fwrite(i8* %byte7, i64 1, i64 1, %struct._IO_FILE* %33), !dbg !771
  %cmp13 = icmp ne i64 %call12, 1, !dbg !771
  %34 = select i1 %cmp13, i64 12, i64 13, !dbg !772
  %35 = getelementptr inbounds [19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 %34, !dbg !772
  %36 = load i64* %35, !dbg !772
  %37 = add i64 %36, 1, !dbg !772
  store i64 %37, i64* %35, !dbg !772
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !772

if.then14:                                        ; preds = %for.body6
  %38 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 14), !dbg !773
  %39 = add i64 %38, 1, !dbg !773
  store i64 %39, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 14), !dbg !773
  store i32 -1, i32* %retval, !dbg !773
  br label %return, !dbg !773

if.end15:                                         ; preds = %for.body6
  %40 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 15), !dbg !774
  %41 = add i64 %40, 1, !dbg !774
  store i64 %41, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 15), !dbg !774
  br label %for.inc16, !dbg !774

for.inc16:                                        ; preds = %if.end15
  %42 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 16), !dbg !775
  %43 = add i64 %42, 1, !dbg !775
  store i64 %43, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 16), !dbg !775
  %44 = load i32* %i3, align 4, !dbg !775
  %inc17 = add nsw i32 %44, 1, !dbg !775
  store i32 %inc17, i32* %i3, align 4, !dbg !775
  br label %for.cond4, !dbg !776

for.end18:                                        ; preds = %for.cond4
  %45 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 17), !dbg !777
  %46 = add i64 %45, 1, !dbg !777
  store i64 %46, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 17), !dbg !777
  store i32 0, i32* %retval, !dbg !777
  br label %return, !dbg !777

return:                                           ; preds = %for.end18, %if.then14, %if.then
  %47 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 18), !dbg !778
  %48 = add i64 %47, 1, !dbg !778
  store i64 %48, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 18), !dbg !778
  %49 = load i32* %retval, !dbg !778
  ret i32 %49, !dbg !778
}

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #0

; Function Attrs: nounwind uwtable
define i32 @_Z6getBFPii(i32 %x, i32 %y) #4 {
entry:
  %0 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 0)
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %no = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !779, metadata !534), !dbg !780
  store i32 %y, i32* %y.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %y.addr, metadata !781, metadata !534), !dbg !782
  call void @llvm.dbg.declare(metadata i32* %no, metadata !783, metadata !534), !dbg !784
  %3 = load i32* %x.addr, align 4, !dbg !785
  %cmp = icmp sgt i32 %3, 0, !dbg !785
  %4 = select i1 %cmp, i64 1, i64 2, !dbg !787
  %5 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 %4, !dbg !787
  %6 = load i64* %5, !dbg !787
  %7 = add i64 %6, 1, !dbg !787
  store i64 %7, i64* %5, !dbg !787
  br i1 %cmp, label %land.lhs.true, label %if.end52, !dbg !787

land.lhs.true:                                    ; preds = %2
  %8 = load i32* %x.addr, align 4, !dbg !788
  %cmp1 = icmp slt i32 %8, 10, !dbg !788
  %9 = select i1 %cmp1, i64 3, i64 4, !dbg !787
  %10 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 %9, !dbg !787
  %11 = load i64* %10, !dbg !787
  %12 = add i64 %11, 1, !dbg !787
  store i64 %12, i64* %10, !dbg !787
  br i1 %cmp1, label %land.lhs.true2, label %if.end52, !dbg !787

land.lhs.true2:                                   ; preds = %land.lhs.true
  %13 = load i32* %y.addr, align 4, !dbg !790
  %cmp3 = icmp sgt i32 %13, 0, !dbg !790
  %14 = select i1 %cmp3, i64 5, i64 6, !dbg !787
  %15 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 %14, !dbg !787
  %16 = load i64* %15, !dbg !787
  %17 = add i64 %16, 1, !dbg !787
  store i64 %17, i64* %15, !dbg !787
  br i1 %cmp3, label %land.lhs.true4, label %if.end52, !dbg !787

land.lhs.true4:                                   ; preds = %land.lhs.true2
  %18 = load i32* %y.addr, align 4, !dbg !792
  %cmp5 = icmp slt i32 %18, 10, !dbg !792
  %19 = select i1 %cmp5, i64 7, i64 8, !dbg !787
  %20 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 %19, !dbg !787
  %21 = load i64* %20, !dbg !787
  %22 = add i64 %21, 1, !dbg !787
  store i64 %22, i64* %20, !dbg !787
  br i1 %cmp5, label %if.then, label %if.end52, !dbg !787

if.then:                                          ; preds = %land.lhs.true4
  %23 = load i32* %y.addr, align 4, !dbg !794
  %cmp6 = icmp slt i32 %23, 5, !dbg !794
  %24 = select i1 %cmp6, i64 9, i64 10, !dbg !797
  %25 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 %24, !dbg !797
  %26 = load i64* %25, !dbg !797
  %27 = add i64 %26, 1, !dbg !797
  store i64 %27, i64* %25, !dbg !797
  br i1 %cmp6, label %if.then7, label %if.end11, !dbg !797

if.then7:                                         ; preds = %if.then
  %28 = load i32* %x.addr, align 4, !dbg !798
  %29 = load i32* %y.addr, align 4, !dbg !800
  %sub = sub nsw i32 5, %29, !dbg !801
  %sub8 = sub nsw i32 9, %sub, !dbg !802
  %cmp9 = icmp sgt i32 %28, %sub8, !dbg !798
  %30 = select i1 %cmp9, i64 11, i64 12, !dbg !803
  %31 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 %30, !dbg !803
  %32 = load i64* %31, !dbg !803
  %33 = add i64 %32, 1, !dbg !803
  store i64 %33, i64* %31, !dbg !803
  br i1 %cmp9, label %if.then10, label %if.end, !dbg !803

if.then10:                                        ; preds = %if.then7
  %34 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 13), !dbg !804
  %35 = add i64 %34, 1, !dbg !804
  store i64 %35, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 13), !dbg !804
  store i32 -1, i32* %retval, !dbg !804
  br label %return, !dbg !804

if.end:                                           ; preds = %if.then7
  %36 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 14), !dbg !805
  %37 = add i64 %36, 1, !dbg !805
  store i64 %37, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 14), !dbg !805
  br label %if.end11, !dbg !805

if.end11:                                         ; preds = %if.end, %if.then
  %38 = load i32* %y.addr, align 4, !dbg !807
  %cmp12 = icmp sgt i32 %38, 5, !dbg !807
  %39 = select i1 %cmp12, i64 15, i64 16, !dbg !809
  %40 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 %39, !dbg !809
  %41 = load i64* %40, !dbg !809
  %42 = add i64 %41, 1, !dbg !809
  store i64 %42, i64* %40, !dbg !809
  br i1 %cmp12, label %if.then13, label %if.end18, !dbg !809

if.then13:                                        ; preds = %if.end11
  %43 = load i32* %x.addr, align 4, !dbg !810
  %44 = load i32* %y.addr, align 4, !dbg !812
  %sub14 = sub nsw i32 %44, 5, !dbg !812
  %cmp15 = icmp sle i32 %43, %sub14, !dbg !810
  %45 = select i1 %cmp15, i64 17, i64 18, !dbg !813
  %46 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 %45, !dbg !813
  %47 = load i64* %46, !dbg !813
  %48 = add i64 %47, 1, !dbg !813
  store i64 %48, i64* %46, !dbg !813
  br i1 %cmp15, label %if.then16, label %if.end17, !dbg !813

if.then16:                                        ; preds = %if.then13
  %49 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 19), !dbg !814
  %50 = add i64 %49, 1, !dbg !814
  store i64 %50, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 19), !dbg !814
  store i32 -1, i32* %retval, !dbg !814
  br label %return, !dbg !814

if.end17:                                         ; preds = %if.then13
  %51 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 20), !dbg !815
  %52 = add i64 %51, 1, !dbg !815
  store i64 %52, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 20), !dbg !815
  br label %if.end18, !dbg !815

if.end18:                                         ; preds = %if.end17, %if.end11
  %53 = load i32* %x.addr, align 4, !dbg !817
  %54 = load i32* %y.addr, align 4, !dbg !818
  %mul = mul nsw i32 %54, 9, !dbg !818
  %add = add nsw i32 %53, %mul, !dbg !817
  %sub19 = sub nsw i32 %add, 10, !dbg !817
  store i32 %sub19, i32* %no, align 4, !dbg !819
  %55 = load i32* %y.addr, align 4, !dbg !820
  %cmp20 = icmp sgt i32 %55, 1, !dbg !820
  %56 = select i1 %cmp20, i64 21, i64 22, !dbg !822
  %57 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 %56, !dbg !822
  %58 = load i64* %57, !dbg !822
  %59 = add i64 %58, 1, !dbg !822
  store i64 %59, i64* %57, !dbg !822
  br i1 %cmp20, label %if.then21, label %if.end23, !dbg !822

if.then21:                                        ; preds = %if.end18
  %60 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 23), !dbg !823
  %61 = add i64 %60, 1, !dbg !823
  store i64 %61, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 23), !dbg !823
  %62 = load i32* %no, align 4, !dbg !823
  %sub22 = sub nsw i32 %62, 4, !dbg !823
  store i32 %sub22, i32* %no, align 4, !dbg !823
  br label %if.end23, !dbg !823

if.end23:                                         ; preds = %if.then21, %if.end18
  %63 = load i32* %y.addr, align 4, !dbg !825
  %cmp24 = icmp sgt i32 %63, 2, !dbg !825
  %64 = select i1 %cmp24, i64 24, i64 25, !dbg !827
  %65 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 %64, !dbg !827
  %66 = load i64* %65, !dbg !827
  %67 = add i64 %66, 1, !dbg !827
  store i64 %67, i64* %65, !dbg !827
  br i1 %cmp24, label %if.then25, label %if.end27, !dbg !827

if.then25:                                        ; preds = %if.end23
  %68 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 26), !dbg !828
  %69 = add i64 %68, 1, !dbg !828
  store i64 %69, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 26), !dbg !828
  %70 = load i32* %no, align 4, !dbg !828
  %sub26 = sub nsw i32 %70, 3, !dbg !828
  store i32 %sub26, i32* %no, align 4, !dbg !828
  br label %if.end27, !dbg !828

if.end27:                                         ; preds = %if.then25, %if.end23
  %71 = load i32* %y.addr, align 4, !dbg !830
  %cmp28 = icmp sgt i32 %71, 3, !dbg !830
  %72 = select i1 %cmp28, i64 27, i64 28, !dbg !832
  %73 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 %72, !dbg !832
  %74 = load i64* %73, !dbg !832
  %75 = add i64 %74, 1, !dbg !832
  store i64 %75, i64* %73, !dbg !832
  br i1 %cmp28, label %if.then29, label %if.end31, !dbg !832

if.then29:                                        ; preds = %if.end27
  %76 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 29), !dbg !833
  %77 = add i64 %76, 1, !dbg !833
  store i64 %77, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 29), !dbg !833
  %78 = load i32* %no, align 4, !dbg !833
  %sub30 = sub nsw i32 %78, 2, !dbg !833
  store i32 %sub30, i32* %no, align 4, !dbg !833
  br label %if.end31, !dbg !833

if.end31:                                         ; preds = %if.then29, %if.end27
  %79 = load i32* %y.addr, align 4, !dbg !835
  %cmp32 = icmp sgt i32 %79, 4, !dbg !835
  %80 = select i1 %cmp32, i64 30, i64 31, !dbg !837
  %81 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 %80, !dbg !837
  %82 = load i64* %81, !dbg !837
  %83 = add i64 %82, 1, !dbg !837
  store i64 %83, i64* %81, !dbg !837
  br i1 %cmp32, label %if.then33, label %if.end35, !dbg !837

if.then33:                                        ; preds = %if.end31
  %84 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 32), !dbg !838
  %85 = add i64 %84, 1, !dbg !838
  store i64 %85, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 32), !dbg !838
  %86 = load i32* %no, align 4, !dbg !838
  %sub34 = sub nsw i32 %86, 1, !dbg !838
  store i32 %sub34, i32* %no, align 4, !dbg !838
  br label %if.end35, !dbg !838

if.end35:                                         ; preds = %if.then33, %if.end31
  %87 = load i32* %y.addr, align 4, !dbg !840
  %cmp36 = icmp sgt i32 %87, 5, !dbg !840
  %88 = select i1 %cmp36, i64 33, i64 34, !dbg !842
  %89 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 %88, !dbg !842
  %90 = load i64* %89, !dbg !842
  %91 = add i64 %90, 1, !dbg !842
  store i64 %91, i64* %89, !dbg !842
  br i1 %cmp36, label %if.then37, label %if.end39, !dbg !842

if.then37:                                        ; preds = %if.end35
  %92 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 35), !dbg !843
  %93 = add i64 %92, 1, !dbg !843
  store i64 %93, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 35), !dbg !843
  %94 = load i32* %no, align 4, !dbg !843
  %sub38 = sub nsw i32 %94, 1, !dbg !843
  store i32 %sub38, i32* %no, align 4, !dbg !843
  br label %if.end39, !dbg !843

if.end39:                                         ; preds = %if.then37, %if.end35
  %95 = load i32* %y.addr, align 4, !dbg !845
  %cmp40 = icmp sgt i32 %95, 6, !dbg !845
  %96 = select i1 %cmp40, i64 36, i64 37, !dbg !847
  %97 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 %96, !dbg !847
  %98 = load i64* %97, !dbg !847
  %99 = add i64 %98, 1, !dbg !847
  store i64 %99, i64* %97, !dbg !847
  br i1 %cmp40, label %if.then41, label %if.end43, !dbg !847

if.then41:                                        ; preds = %if.end39
  %100 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 38), !dbg !848
  %101 = add i64 %100, 1, !dbg !848
  store i64 %101, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 38), !dbg !848
  %102 = load i32* %no, align 4, !dbg !848
  %sub42 = sub nsw i32 %102, 2, !dbg !848
  store i32 %sub42, i32* %no, align 4, !dbg !848
  br label %if.end43, !dbg !848

if.end43:                                         ; preds = %if.then41, %if.end39
  %103 = load i32* %y.addr, align 4, !dbg !850
  %cmp44 = icmp sgt i32 %103, 7, !dbg !850
  %104 = select i1 %cmp44, i64 39, i64 40, !dbg !852
  %105 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 %104, !dbg !852
  %106 = load i64* %105, !dbg !852
  %107 = add i64 %106, 1, !dbg !852
  store i64 %107, i64* %105, !dbg !852
  br i1 %cmp44, label %if.then45, label %if.end47, !dbg !852

if.then45:                                        ; preds = %if.end43
  %108 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 41), !dbg !853
  %109 = add i64 %108, 1, !dbg !853
  store i64 %109, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 41), !dbg !853
  %110 = load i32* %no, align 4, !dbg !853
  %sub46 = sub nsw i32 %110, 3, !dbg !853
  store i32 %sub46, i32* %no, align 4, !dbg !853
  br label %if.end47, !dbg !853

if.end47:                                         ; preds = %if.then45, %if.end43
  %111 = load i32* %y.addr, align 4, !dbg !855
  %cmp48 = icmp sgt i32 %111, 8, !dbg !855
  %112 = select i1 %cmp48, i64 42, i64 43, !dbg !857
  %113 = getelementptr inbounds [48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 %112, !dbg !857
  %114 = load i64* %113, !dbg !857
  %115 = add i64 %114, 1, !dbg !857
  store i64 %115, i64* %113, !dbg !857
  br i1 %cmp48, label %if.then49, label %if.end51, !dbg !857

if.then49:                                        ; preds = %if.end47
  %116 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 44), !dbg !858
  %117 = add i64 %116, 1, !dbg !858
  store i64 %117, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 44), !dbg !858
  %118 = load i32* %no, align 4, !dbg !858
  %sub50 = sub nsw i32 %118, 4, !dbg !858
  store i32 %sub50, i32* %no, align 4, !dbg !858
  br label %if.end51, !dbg !858

if.end51:                                         ; preds = %if.then49, %if.end47
  %119 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 45), !dbg !860
  %120 = add i64 %119, 1, !dbg !860
  store i64 %120, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 45), !dbg !860
  %121 = load i32* %no, align 4, !dbg !860
  store i32 %121, i32* %retval, !dbg !861
  br label %return, !dbg !861

if.end52:                                         ; preds = %land.lhs.true4, %land.lhs.true2, %land.lhs.true, %2
  %122 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 46), !dbg !862
  %123 = add i64 %122, 1, !dbg !862
  store i64 %123, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 46), !dbg !862
  store i32 -1, i32* %retval, !dbg !862
  br label %return, !dbg !862

return:                                           ; preds = %if.end52, %if.end51, %if.then16, %if.then10
  %124 = load i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 47), !dbg !863
  %125 = add i64 %124, 1, !dbg !863
  store i64 %125, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 47), !dbg !863
  %126 = load i32* %retval, !dbg !863
  ret i32 %126, !dbg !863
}

; Function Attrs: uwtable
define void @_ZN10BitBoard645printEv(%class.BitBoard64* %this) #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 0)
  %this.addr = alloca %class.BitBoard64*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %no = alloca i32, align 4
  %off = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 1)
  store %class.BitBoard64* %this, %class.BitBoard64** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.BitBoard64** %this.addr, metadata !864, metadata !534), !dbg !865
  %this1 = load %class.BitBoard64** %this.addr
  call void @llvm.dbg.declare(metadata i32* %x, metadata !866, metadata !534), !dbg !867
  call void @llvm.dbg.declare(metadata i32* %y, metadata !868, metadata !534), !dbg !869
  call void @llvm.dbg.declare(metadata i32* %no, metadata !870, metadata !534), !dbg !871
  call void @llvm.dbg.declare(metadata i32* %off, metadata !872, metadata !534), !dbg !873
  store i32 1, i32* %y, align 4, !dbg !874
  br label %for.cond, !dbg !874

for.cond:                                         ; preds = %for.inc24, %2
  %5 = load i32* %y, align 4, !dbg !876
  %cmp = icmp slt i32 %5, 10, !dbg !876
  %6 = select i1 %cmp, i64 2, i64 3, !dbg !880
  %7 = getelementptr inbounds [28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 %6, !dbg !880
  %8 = load i64* %7, !dbg !880
  %9 = add i64 %8, 1, !dbg !880
  store i64 %9, i64* %7, !dbg !880
  br i1 %cmp, label %for.body, label %for.end26, !dbg !880

for.body:                                         ; preds = %for.cond
  %10 = load i32* %y, align 4, !dbg !881
  %cmp2 = icmp slt i32 %10, 5, !dbg !881
  %11 = select i1 %cmp2, i64 4, i64 5, !dbg !884
  %12 = getelementptr inbounds [28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 %11, !dbg !884
  %13 = load i64* %12, !dbg !884
  %14 = add i64 %13, 1, !dbg !884
  store i64 %14, i64* %12, !dbg !884
  br i1 %cmp2, label %if.then, label %if.end, !dbg !884

if.then:                                          ; preds = %for.body
  %15 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 6), !dbg !885
  %16 = add i64 %15, 1, !dbg !885
  store i64 %16, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 6), !dbg !885
  store i32 0, i32* %off, align 4, !dbg !885
  br label %for.cond3, !dbg !885

for.cond3:                                        ; preds = %for.inc, %if.then
  %17 = load i32* %off, align 4, !dbg !888
  %18 = load i32* %y, align 4, !dbg !892
  %sub = sub nsw i32 5, %18, !dbg !893
  %cmp4 = icmp slt i32 %17, %sub, !dbg !894
  %19 = select i1 %cmp4, i64 7, i64 8, !dbg !895
  %20 = getelementptr inbounds [28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 %19, !dbg !895
  %21 = load i64* %20, !dbg !895
  %22 = add i64 %21, 1, !dbg !895
  store i64 %22, i64* %20, !dbg !895
  br i1 %cmp4, label %for.body5, label %for.end, !dbg !895

for.body5:                                        ; preds = %for.cond3
  %23 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 9), !dbg !896
  %24 = add i64 %23, 1, !dbg !896
  store i64 %24, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 9), !dbg !896
  %call = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)), !dbg !896
  br label %for.inc, !dbg !897

for.inc:                                          ; preds = %for.body5
  %25 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 10), !dbg !898
  %26 = add i64 %25, 1, !dbg !898
  store i64 %26, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 10), !dbg !898
  %27 = load i32* %off, align 4, !dbg !898
  %inc = add nsw i32 %27, 1, !dbg !898
  store i32 %inc, i32* %off, align 4, !dbg !898
  br label %for.cond3, !dbg !899

for.end:                                          ; preds = %for.cond3
  %28 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 11), !dbg !900
  %29 = add i64 %28, 1, !dbg !900
  store i64 %29, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 11), !dbg !900
  br label %if.end, !dbg !900

if.end:                                           ; preds = %for.end, %for.body
  %30 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 12), !dbg !901
  %31 = add i64 %30, 1, !dbg !901
  store i64 %31, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 12), !dbg !901
  store i32 1, i32* %x, align 4, !dbg !901
  br label %for.cond6, !dbg !901

for.cond6:                                        ; preds = %for.inc20, %if.end
  %32 = load i32* %x, align 4, !dbg !903
  %cmp7 = icmp slt i32 %32, 10, !dbg !903
  %33 = select i1 %cmp7, i64 13, i64 14, !dbg !907
  %34 = getelementptr inbounds [28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 %33, !dbg !907
  %35 = load i64* %34, !dbg !907
  %36 = add i64 %35, 1, !dbg !907
  store i64 %36, i64* %34, !dbg !907
  br i1 %cmp7, label %for.body8, label %for.end22, !dbg !907

for.body8:                                        ; preds = %for.cond6
  %37 = load i32* %x, align 4, !dbg !908
  %38 = load i32* %y, align 4, !dbg !911
  %call9 = call i32 @_Z6getBFPii(i32 %37, i32 %38), !dbg !912
  store i32 %call9, i32* %no, align 4, !dbg !913
  %cmp10 = icmp eq i32 %call9, -1, !dbg !914
  %39 = select i1 %cmp10, i64 15, i64 16, !dbg !915
  %40 = getelementptr inbounds [28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 %39, !dbg !915
  %41 = load i64* %40, !dbg !915
  %42 = add i64 %41, 1, !dbg !915
  store i64 %42, i64* %40, !dbg !915
  br i1 %cmp10, label %if.then11, label %if.else, !dbg !915

if.then11:                                        ; preds = %for.body8
  %43 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 17), !dbg !916
  %44 = add i64 %43, 1, !dbg !916
  store i64 %44, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 17), !dbg !916
  %call12 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)), !dbg !916
  br label %if.end19, !dbg !917

if.else:                                          ; preds = %for.body8
  %45 = load i32* %no, align 4, !dbg !918
  %call13 = call i32 @_ZN10BitBoard646getBitEi(%class.BitBoard64* %this1, i32 %45), !dbg !921
  %tobool = icmp ne i32 %call13, 0, !dbg !921
  %46 = select i1 %tobool, i64 18, i64 19, !dbg !922
  %47 = getelementptr inbounds [28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 %46, !dbg !922
  %48 = load i64* %47, !dbg !922
  %49 = add i64 %48, 1, !dbg !922
  store i64 %49, i64* %47, !dbg !922
  br i1 %tobool, label %if.then14, label %if.else16, !dbg !922

if.then14:                                        ; preds = %if.else
  %50 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 20), !dbg !923
  %51 = add i64 %50, 1, !dbg !923
  store i64 %51, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 20), !dbg !923
  %call15 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0)), !dbg !923
  br label %if.end18, !dbg !924

if.else16:                                        ; preds = %if.else
  %52 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 21), !dbg !925
  %53 = add i64 %52, 1, !dbg !925
  store i64 %53, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 21), !dbg !925
  %call17 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0)), !dbg !925
  br label %if.end18

if.end18:                                         ; preds = %if.else16, %if.then14
  %54 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 22)
  %55 = add i64 %54, 1
  store i64 %55, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 22)
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %if.then11
  %56 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 23), !dbg !926
  %57 = add i64 %56, 1, !dbg !926
  store i64 %57, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 23), !dbg !926
  br label %for.inc20, !dbg !926

for.inc20:                                        ; preds = %if.end19
  %58 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 24), !dbg !927
  %59 = add i64 %58, 1, !dbg !927
  store i64 %59, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 24), !dbg !927
  %60 = load i32* %x, align 4, !dbg !927
  %inc21 = add nsw i32 %60, 1, !dbg !927
  store i32 %inc21, i32* %x, align 4, !dbg !927
  br label %for.cond6, !dbg !928

for.end22:                                        ; preds = %for.cond6
  %61 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 25), !dbg !929
  %62 = add i64 %61, 1, !dbg !929
  store i64 %62, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 25), !dbg !929
  %call23 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cout, i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0)), !dbg !929
  br label %for.inc24, !dbg !930

for.inc24:                                        ; preds = %for.end22
  %63 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 26), !dbg !931
  %64 = add i64 %63, 1, !dbg !931
  store i64 %64, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 26), !dbg !931
  %65 = load i32* %y, align 4, !dbg !931
  %inc25 = add nsw i32 %65, 1, !dbg !931
  store i32 %inc25, i32* %y, align 4, !dbg !931
  br label %for.cond, !dbg !932

for.end26:                                        ; preds = %for.cond
  %66 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 27), !dbg !933
  %67 = add i64 %66, 1, !dbg !933
  store i64 %67, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 27), !dbg !933
  ret void, !dbg !933
}

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #0

define internal void @_GLOBAL__sub_I_bitboard64.cpp() section ".text.startup" {
entry:
  call void @__cxx_global_var_init(), !dbg !934
  ret void
}

; Function Attrs: noinline
define internal void @__llvm_gcov_writeout() unnamed_addr #5 {
entry:
  call void @llvm_gcda_start_file(i8* getelementptr inbounds ([92 x i8]* @1, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @0, i32 0, i32 0), i32 -2138480369)
  call void @llvm_gcda_emit_function(i32 0, i8* getelementptr inbounds ([22 x i8]* @2, i32 0, i32 0), i32 -343593632, i8 0, i32 -2138480369)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 1, i8* getelementptr inbounds ([20 x i8]* @3, i32 0, i32 0), i32 -676366875, i8 0, i32 -2138480369)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr4, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 2, i8* getelementptr inbounds ([23 x i8]* @4, i32 0, i32 0), i32 -1898518481, i8 0, i32 -2138480369)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr5, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 3, i8* getelementptr inbounds ([23 x i8]* @5, i32 0, i32 0), i32 -174856538, i8 0, i32 -2138480369)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr6, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 4, i8* getelementptr inbounds ([23 x i8]* @6, i32 0, i32 0), i32 -574619345, i8 0, i32 -2138480369)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr7, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 5, i8* getelementptr inbounds ([23 x i8]* @7, i32 0, i32 0), i32 406284613, i8 0, i32 -2138480369)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr8, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 6, i8* getelementptr inbounds ([21 x i8]* @8, i32 0, i32 0), i32 43548193, i8 0, i32 -2138480369)
  call void @llvm_gcda_emit_arcs(i32 5, i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr9, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 7, i8* getelementptr inbounds ([25 x i8]* @9, i32 0, i32 0), i32 -1364808514, i8 0, i32 -2138480369)
  call void @llvm_gcda_emit_arcs(i32 11, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr10, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 8, i8* getelementptr inbounds ([27 x i8]* @10, i32 0, i32 0), i32 -1904220849, i8 0, i32 -2138480369)
  call void @llvm_gcda_emit_arcs(i32 11, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr11, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 9, i8* getelementptr inbounds ([25 x i8]* @11, i32 0, i32 0), i32 -802663744, i8 0, i32 -2138480369)
  call void @llvm_gcda_emit_arcs(i32 11, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr12, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 10, i8* getelementptr inbounds ([41 x i8]* @12, i32 0, i32 0), i32 2143328051, i8 0, i32 -2138480369)
  call void @llvm_gcda_emit_arcs(i32 19, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr13, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 11, i8* getelementptr inbounds ([40 x i8]* @13, i32 0, i32 0), i32 -104116623, i8 0, i32 -2138480369)
  call void @llvm_gcda_emit_arcs(i32 19, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr14, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 12, i8* getelementptr inbounds ([12 x i8]* @14, i32 0, i32 0), i32 -1378024039, i8 0, i32 -2138480369)
  call void @llvm_gcda_emit_arcs(i32 48, i64* getelementptr inbounds ([48 x i64]* @__llvm_gcov_ctr15, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 13, i8* getelementptr inbounds ([24 x i8]* @15, i32 0, i32 0), i32 -48373104, i8 0, i32 -2138480369)
  call void @llvm_gcda_emit_arcs(i32 28, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr16, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 14, i8* getelementptr inbounds ([21 x i8]* @16, i32 0, i32 0), i32 757312497, i8 0, i32 -2138480369)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr17, i64 0, i64 0))
  call void @llvm_gcda_summary_info()
  call void @llvm_gcda_end_file()
  ret void
}

declare void @llvm_gcda_start_file(i8*, i8*, i32)

declare void @llvm_gcda_emit_function(i32, i8*, i32, i8, i32)

declare void @llvm_gcda_emit_arcs(i32, i64*)

declare void @llvm_gcda_summary_info()

declare void @llvm_gcda_end_file()

; Function Attrs: noinline
define internal void @__llvm_gcov_flush() unnamed_addr #5 {
entry:
  call void @__llvm_gcov_writeout()
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr4
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr5
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr6
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr7
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr8
  store [5 x i64] zeroinitializer, [5 x i64]* @__llvm_gcov_ctr9
  store [11 x i64] zeroinitializer, [11 x i64]* @__llvm_gcov_ctr10
  store [11 x i64] zeroinitializer, [11 x i64]* @__llvm_gcov_ctr11
  store [11 x i64] zeroinitializer, [11 x i64]* @__llvm_gcov_ctr12
  store [19 x i64] zeroinitializer, [19 x i64]* @__llvm_gcov_ctr13
  store [19 x i64] zeroinitializer, [19 x i64]* @__llvm_gcov_ctr14
  store [48 x i64] zeroinitializer, [48 x i64]* @__llvm_gcov_ctr15
  store [28 x i64] zeroinitializer, [28 x i64]* @__llvm_gcov_ctr16
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr17
  ret void
}

; Function Attrs: noinline
define internal void @__llvm_gcov_init() unnamed_addr #5 {
entry:
  call void @llvm_gcov_init(void ()* @__llvm_gcov_writeout, void ()* @__llvm_gcov_flush)
  ret void
}

declare void @llvm_gcov_init(void ()*, void ()*)

attributes #0 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!527, !528}
!llvm.gcov = !{!529}
!llvm.ident = !{!530}

!0 = !{!"0x11\004\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !141, !166, !168} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp] [DW_LANG_C_plus_plus]
!1 = !{!"bitboard64.cpp", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!2 = !{}
!3 = !{!4, !10, !19, !72, !78, !79, !81, !85, !97, !91, !140}
!4 = !{!"0x13\00\0082\0064\0032\000\000\000", !5, null, null, !6, null, null, !"_ZTS11__mbstate_t"} ; [ DW_TAG_structure_type ] [line 82, size 64, align 32, offset 0] [def] [from ]
!5 = !{!"/usr/include/wchar.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!6 = !{!7, !9}
!7 = !{!"0xd\00__count\0084\0032\0032\000\000", !5, !"_ZTS11__mbstate_t", !8} ; [ DW_TAG_member ] [__count] [line 84, size 32, align 32, offset 0] [from int]
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0xd\00__value\0093\0032\0032\0032\000", !5, !"_ZTS11__mbstate_t", !"_ZTSN11__mbstate_tUt_E"} ; [ DW_TAG_member ] [__value] [line 93, size 32, align 32, offset 32] [from _ZTSN11__mbstate_tUt_E]
!10 = !{!"0x17\00\0085\0032\0032\000\000\000", !5, !"_ZTS11__mbstate_t", null, !11, null, null, !"_ZTSN11__mbstate_tUt_E"} ; [ DW_TAG_union_type ] [line 85, size 32, align 32, offset 0] [def] [from ]
!11 = !{!12, !14}
!12 = !{!"0xd\00__wch\0088\0032\0032\000\000", !5, !"_ZTSN11__mbstate_tUt_E", !13} ; [ DW_TAG_member ] [__wch] [line 88, size 32, align 32, offset 0] [from unsigned int]
!13 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!14 = !{!"0xd\00__wchb\0092\0032\008\000\000", !5, !"_ZTSN11__mbstate_tUt_E", !15} ; [ DW_TAG_member ] [__wchb] [line 92, size 32, align 8, offset 0] [from ]
!15 = !{!"0x1\00\000\0032\008\000\000\000", null, null, !16, !17, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 32, align 8, offset 0] [from char]
!16 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!17 = !{!18}
!18 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!19 = !{!"0x13\00_IO_FILE\00245\001728\0064\000\000\000", !20, null, null, !21, null, null, !"_ZTS8_IO_FILE"} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [def] [from ]
!20 = !{!"/usr/include/libio.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!21 = !{!22, !23, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !37, !39, !40, !41, !45, !47, !49, !53, !56, !58, !60, !61, !62, !63, !67, !68}
!22 = !{!"0xd\00_flags\00246\0032\0032\000\000", !20, !"_ZTS8_IO_FILE", !8} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!23 = !{!"0xd\00_IO_read_ptr\00251\0064\0064\0064\000", !20, !"_ZTS8_IO_FILE", !24} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!24 = !{!"0xf\00\000\0064\0064\000\000", null, null, !16} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!25 = !{!"0xd\00_IO_read_end\00252\0064\0064\00128\000", !20, !"_ZTS8_IO_FILE", !24} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!26 = !{!"0xd\00_IO_read_base\00253\0064\0064\00192\000", !20, !"_ZTS8_IO_FILE", !24} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!27 = !{!"0xd\00_IO_write_base\00254\0064\0064\00256\000", !20, !"_ZTS8_IO_FILE", !24} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!28 = !{!"0xd\00_IO_write_ptr\00255\0064\0064\00320\000", !20, !"_ZTS8_IO_FILE", !24} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!29 = !{!"0xd\00_IO_write_end\00256\0064\0064\00384\000", !20, !"_ZTS8_IO_FILE", !24} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!30 = !{!"0xd\00_IO_buf_base\00257\0064\0064\00448\000", !20, !"_ZTS8_IO_FILE", !24} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!31 = !{!"0xd\00_IO_buf_end\00258\0064\0064\00512\000", !20, !"_ZTS8_IO_FILE", !24} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!32 = !{!"0xd\00_IO_save_base\00260\0064\0064\00576\000", !20, !"_ZTS8_IO_FILE", !24} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!33 = !{!"0xd\00_IO_backup_base\00261\0064\0064\00640\000", !20, !"_ZTS8_IO_FILE", !24} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!34 = !{!"0xd\00_IO_save_end\00262\0064\0064\00704\000", !20, !"_ZTS8_IO_FILE", !24} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!35 = !{!"0xd\00_markers\00264\0064\0064\00768\000", !20, !"_ZTS8_IO_FILE", !36} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!36 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS10_IO_marker"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS10_IO_marker]
!37 = !{!"0xd\00_chain\00266\0064\0064\00832\000", !20, !"_ZTS8_IO_FILE", !38} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!38 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS8_IO_FILE"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS8_IO_FILE]
!39 = !{!"0xd\00_fileno\00268\0032\0032\00896\000", !20, !"_ZTS8_IO_FILE", !8} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!40 = !{!"0xd\00_flags2\00272\0032\0032\00928\000", !20, !"_ZTS8_IO_FILE", !8} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!41 = !{!"0xd\00_old_offset\00274\0064\0064\00960\000", !20, !"_ZTS8_IO_FILE", !42} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!42 = !{!"0x16\00__off_t\00131\000\000\000\000", !43, null, !44} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!43 = !{!"/usr/include/x86_64-linux-gnu/bits/types.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!44 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!45 = !{!"0xd\00_cur_column\00278\0016\0016\001024\000", !20, !"_ZTS8_IO_FILE", !46} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!46 = !{!"0x24\00unsigned short\000\0016\0016\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!47 = !{!"0xd\00_vtable_offset\00279\008\008\001040\000", !20, !"_ZTS8_IO_FILE", !48} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!48 = !{!"0x24\00signed char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [signed char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!49 = !{!"0xd\00_shortbuf\00280\008\008\001048\000", !20, !"_ZTS8_IO_FILE", !50} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!50 = !{!"0x1\00\000\008\008\000\000\000", null, null, !16, !51, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from char]
!51 = !{!52}
!52 = !{!"0x21\000\001"}                          ; [ DW_TAG_subrange_type ] [0, 0]
!53 = !{!"0xd\00_lock\00284\0064\0064\001088\000", !20, !"_ZTS8_IO_FILE", !54} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!54 = !{!"0xf\00\000\0064\0064\000\000", null, null, !55} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_lock_t]
!55 = !{!"0x16\00_IO_lock_t\00154\000\000\000\000", !20, null, null} ; [ DW_TAG_typedef ] [_IO_lock_t] [line 154, size 0, align 0, offset 0] [from ]
!56 = !{!"0xd\00_offset\00293\0064\0064\001152\000", !20, !"_ZTS8_IO_FILE", !57} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!57 = !{!"0x16\00__off64_t\00132\000\000\000\000", !43, null, !44} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!58 = !{!"0xd\00__pad1\00302\0064\0064\001216\000", !20, !"_ZTS8_IO_FILE", !59} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!59 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!60 = !{!"0xd\00__pad2\00303\0064\0064\001280\000", !20, !"_ZTS8_IO_FILE", !59} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!61 = !{!"0xd\00__pad3\00304\0064\0064\001344\000", !20, !"_ZTS8_IO_FILE", !59} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!62 = !{!"0xd\00__pad4\00305\0064\0064\001408\000", !20, !"_ZTS8_IO_FILE", !59} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!63 = !{!"0xd\00__pad5\00306\0064\0064\001472\000", !20, !"_ZTS8_IO_FILE", !64} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!64 = !{!"0x16\00size_t\0062\000\000\000\000", !65, null, !66} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!65 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!66 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!67 = !{!"0xd\00_mode\00308\0032\0032\001536\000", !20, !"_ZTS8_IO_FILE", !8} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!68 = !{!"0xd\00_unused2\00310\00160\008\001568\000", !20, !"_ZTS8_IO_FILE", !69} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!69 = !{!"0x1\00\000\00160\008\000\000\000", null, null, !16, !70, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160, align 8, offset 0] [from char]
!70 = !{!71}
!71 = !{!"0x21\000\0020"}                         ; [ DW_TAG_subrange_type ] [0, 19]
!72 = !{!"0x13\00__va_list_tag\000\00192\0064\000\000\000", !1, null, null, !73, null, null, !"_ZTS13__va_list_tag"} ; [ DW_TAG_structure_type ] [__va_list_tag] [line 0, size 192, align 64, offset 0] [def] [from ]
!73 = !{!74, !75, !76, !77}
!74 = !{!"0xd\00gp_offset\000\0032\0032\000\000", !1, !"_ZTS13__va_list_tag", !13} ; [ DW_TAG_member ] [gp_offset] [line 0, size 32, align 32, offset 0] [from unsigned int]
!75 = !{!"0xd\00fp_offset\000\0032\0032\0032\000", !1, !"_ZTS13__va_list_tag", !13} ; [ DW_TAG_member ] [fp_offset] [line 0, size 32, align 32, offset 32] [from unsigned int]
!76 = !{!"0xd\00overflow_arg_area\000\0064\0064\0064\000", !1, !"_ZTS13__va_list_tag", !59} ; [ DW_TAG_member ] [overflow_arg_area] [line 0, size 64, align 64, offset 64] [from ]
!77 = !{!"0xd\00reg_save_area\000\0064\0064\00128\000", !1, !"_ZTS13__va_list_tag", !59} ; [ DW_TAG_member ] [reg_save_area] [line 0, size 64, align 64, offset 128] [from ]
!78 = !{!"0x13\00tm\00137\000\000\000\004\000", !5, null, null, null, null, null, !"_ZTS2tm"} ; [ DW_TAG_structure_type ] [tm] [line 137, size 0, align 0, offset 0] [decl] [from ]
!79 = !{!"0x13\00lconv\0053\000\000\000\004\000", !80, null, null, null, null, null, !"_ZTS5lconv"} ; [ DW_TAG_structure_type ] [lconv] [line 53, size 0, align 0, offset 0] [decl] [from ]
!80 = !{!"/usr/include/locale.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!81 = !{!"0x2\00ios_base\00199\000\000\000\004\000", !82, !83, null, null, null, null, !"_ZTSSt8ios_base"} ; [ DW_TAG_class_type ] [ios_base] [line 199, size 0, align 0, offset 0] [decl] [from ]
!82 = !{!"/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/bits/ios_base.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!83 = !{!"0x39\00std\00184", !84, null}           ; [ DW_TAG_namespace ] [std] [line 184]
!84 = !{!"/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/x86_64-linux-gnu/c++/4.8/bits/c++config.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!85 = !{!"0x2\00Init\00533\008\008\000\000\000", !82, !"_ZTSSt8ios_base", null, !86, null, null, !"_ZTSNSt8ios_base4InitE"} ; [ DW_TAG_class_type ] [Init] [line 533, size 8, align 8, offset 0] [def] [from ]
!86 = !{!87, !90, !92, !96}
!87 = !{!"0xd\00_S_refcount\00541\000\000\000\004096", !82, !"_ZTSNSt8ios_base4InitE", !88, null} ; [ DW_TAG_member ] [_S_refcount] [line 541, size 0, align 0, offset 0] [static] [from _Atomic_word]
!88 = !{!"0x16\00_Atomic_word\0032\000\000\000\000", !89, null, !8} ; [ DW_TAG_typedef ] [_Atomic_word] [line 32, size 0, align 0, offset 0] [from int]
!89 = !{!"/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/x86_64-linux-gnu/c++/4.8/bits/atomic_word.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!90 = !{!"0xd\00_S_synced_with_stdio\00542\000\000\000\004096", !82, !"_ZTSNSt8ios_base4InitE", !91, null} ; [ DW_TAG_member ] [_S_synced_with_stdio] [line 542, size 0, align 0, offset 0] [static] [from bool]
!91 = !{!"0x24\00bool\000\008\008\000\000\002", null, null} ; [ DW_TAG_base_type ] [bool] [line 0, size 8, align 8, offset 0, enc DW_ATE_boolean]
!92 = !{!"0x2e\00Init\00Init\00\00537\000\000\000\000\00259\000\00537", !82, !"_ZTSNSt8ios_base4InitE", !93, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 537] [public] [Init]
!93 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !94, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!94 = !{null, !95}
!95 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTSNSt8ios_base4InitE"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTSNSt8ios_base4InitE]
!96 = !{!"0x2e\00~Init\00~Init\00\00538\000\000\000\000\00259\000\00538", !82, !"_ZTSNSt8ios_base4InitE", !93, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 538] [public] [~Init]
!97 = !{!"0x2\00BitBoard64\0031\0064\0032\000\000\000", !98, null, null, !99, null, null, !"_ZTS10BitBoard64"} ; [ DW_TAG_class_type ] [BitBoard64] [line 31, size 64, align 32, offset 0] [def] [from ]
!98 = !{!"./bitboard64.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!99 = !{!100, !103, !104, !108, !111, !114, !115, !118, !123, !124, !125, !126, !129, !132, !133, !139}
!100 = !{!"0xd\00lowbits\0056\0032\0032\000\000", !98, !"_ZTS10BitBoard64", !101} ; [ DW_TAG_member ] [lowbits] [line 56, size 32, align 32, offset 0] [from uint32_t]
!101 = !{!"0x16\00uint32_t\0051\000\000\000\000", !102, null, !13} ; [ DW_TAG_typedef ] [uint32_t] [line 51, size 0, align 0, offset 0] [from unsigned int]
!102 = !{!"/usr/include/stdint.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!103 = !{!"0xd\00highbits\0056\0032\0032\0032\000", !98, !"_ZTS10BitBoard64", !101} ; [ DW_TAG_member ] [highbits] [line 56, size 32, align 32, offset 32] [from uint32_t]
!104 = !{!"0x2e\00BitBoard64\00BitBoard64\00\0034\000\000\000\000\00259\000\0034", !98, !"_ZTS10BitBoard64", !105, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 34] [public] [BitBoard64]
!105 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !106, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!106 = !{null, !107}
!107 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS10BitBoard64"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS10BitBoard64]
!108 = !{!"0x2e\00BitBoard64\00BitBoard64\00\0035\000\000\000\000\00259\000\0035", !98, !"_ZTS10BitBoard64", !109, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 35] [public] [BitBoard64]
!109 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !110, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!110 = !{null, !107, !101, !101}
!111 = !{!"0x2e\00setBit\00setBit\00_ZN10BitBoard646setBitEi\0037\000\000\000\000\00259\000\0037", !98, !"_ZTS10BitBoard64", !112, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 37] [public] [setBit]
!112 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !113, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!113 = !{null, !107, !8}
!114 = !{!"0x2e\00unSetBit\00unSetBit\00_ZN10BitBoard648unSetBitEi\0038\000\000\000\000\00259\000\0038", !98, !"_ZTS10BitBoard64", !112, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 38] [public] [unSetBit]
!115 = !{!"0x2e\00getBit\00getBit\00_ZN10BitBoard646getBitEi\0039\000\000\000\000\00259\000\0039", !98, !"_ZTS10BitBoard64", !116, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 39] [public] [getBit]
!116 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !117, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!117 = !{!8, !107, !8}
!118 = !{!"0x2e\00operator&\00operator&\00_ZN10BitBoard64anERKS_\0041\000\000\000\000\00259\000\0041", !98, !"_ZTS10BitBoard64", !119, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 41] [public] [operator&]
!119 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !120, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!120 = !{!"_ZTS10BitBoard64", !107, !121}
!121 = !{!"0x10\00\000\000\000\000\000", null, null, !122} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!122 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS10BitBoard64"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS10BitBoard64]
!123 = !{!"0x2e\00operator|\00operator|\00_ZN10BitBoard64orERKS_\0042\000\000\000\000\00259\000\0042", !98, !"_ZTS10BitBoard64", !119, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 42] [public] [operator|]
!124 = !{!"0x2e\00operator^\00operator^\00_ZN10BitBoard64eoERKS_\0043\000\000\000\000\00259\000\0043", !98, !"_ZTS10BitBoard64", !119, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 43] [public] [operator^]
!125 = !{!"0x2e\00operator=\00operator=\00_ZN10BitBoard64aSERKS_\0044\000\000\000\000\00259\000\0044", !98, !"_ZTS10BitBoard64", !119, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 44] [public] [operator=]
!126 = !{!"0x2e\00operator~\00operator~\00_ZN10BitBoard64coEv\0045\000\000\000\000\00259\000\0045", !98, !"_ZTS10BitBoard64", !127, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 45] [public] [operator~]
!127 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !128, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!128 = !{!"_ZTS10BitBoard64", !107}
!129 = !{!"0x2e\00operator bool\00operator bool\00_ZN10BitBoard64cvbEv\0047\000\000\000\000\00259\000\0047", !98, !"_ZTS10BitBoard64", !130, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 47] [public] [operator bool]
!130 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !131, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!131 = !{!91, !107}
!132 = !{!"0x2e\00print\00print\00_ZN10BitBoard645printEv\0049\000\000\000\000\00259\000\0049", !98, !"_ZTS10BitBoard64", !105, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 49] [public] [print]
!133 = !{!"0x2e\00readFromFile\00readFromFile\00_ZN10BitBoard6412readFromFileEP8_IO_FILE\0051\000\000\000\000\00259\000\0051", !98, !"_ZTS10BitBoard64", !134, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 51] [public] [readFromFile]
!134 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !135, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!135 = !{!8, !107, !136}
!136 = !{!"0xf\00\000\0064\0064\000\000", null, null, !137} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!137 = !{!"0x16\00FILE\0048\000\000\000\000", !138, null, !"_ZTS8_IO_FILE"} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _ZTS8_IO_FILE]
!138 = !{!"/usr/include/stdio.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!139 = !{!"0x2e\00writeToFile\00writeToFile\00_ZN10BitBoard6411writeToFileEP8_IO_FILE\0052\000\000\000\000\00259\000\0052", !98, !"_ZTS10BitBoard64", !134, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 52] [public] [writeToFile]
!140 = !{!"0x13\00_IO_marker\00160\000\000\000\004\000", !20, null, null, null, null, null, !"_ZTS10_IO_marker"} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 0, align 0, offset 0] [decl] [from ]
!141 = !{!142, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !162, !163, !164}
!142 = !{!"0x2e\00__cxx_global_var_init\00__cxx_global_var_init\00\0074\001\001\000\000\00256\000\0074", !143, !144, !145, null, void ()* @__cxx_global_var_init, null, null, !2} ; [ DW_TAG_subprogram ] [line 74] [local] [def] [__cxx_global_var_init]
!143 = !{!"/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/iostream", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!144 = !{!"0x29", !143}                           ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon//usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/iostream]
!145 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !146, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!146 = !{null}
!147 = !{!"0x2e\00operator~\00operator~\00_ZN10BitBoard64coEv\0030\000\001\000\000\00256\000\0031", !1, !"_ZTS10BitBoard64", !127, null, i64 (%class.BitBoard64*)* @_ZN10BitBoard64coEv, null, !126, !2} ; [ DW_TAG_subprogram ] [line 30] [def] [scope 31] [operator~]
!148 = !{!"0x2e\00operator&\00operator&\00_ZN10BitBoard64anERKS_\0036\000\001\000\000\00256\000\0037", !1, !"_ZTS10BitBoard64", !119, null, i64 (%class.BitBoard64*, %class.BitBoard64*)* @_ZN10BitBoard64anERKS_, null, !118, !2} ; [ DW_TAG_subprogram ] [line 36] [def] [scope 37] [operator&]
!149 = !{!"0x2e\00operator|\00operator|\00_ZN10BitBoard64orERKS_\0042\000\001\000\000\00256\000\0043", !1, !"_ZTS10BitBoard64", !119, null, i64 (%class.BitBoard64*, %class.BitBoard64*)* @_ZN10BitBoard64orERKS_, null, !123, !2} ; [ DW_TAG_subprogram ] [line 42] [def] [scope 43] [operator|]
!150 = !{!"0x2e\00operator=\00operator=\00_ZN10BitBoard64aSERKS_\0048\000\001\000\000\00256\000\0049", !1, !"_ZTS10BitBoard64", !119, null, i64 (%class.BitBoard64*, %class.BitBoard64*)* @_ZN10BitBoard64aSERKS_, null, !125, !2} ; [ DW_TAG_subprogram ] [line 48] [def] [scope 49] [operator=]
!151 = !{!"0x2e\00operator^\00operator^\00_ZN10BitBoard64eoERKS_\0055\000\001\000\000\00256\000\0056", !1, !"_ZTS10BitBoard64", !119, null, i64 (%class.BitBoard64*, %class.BitBoard64*)* @_ZN10BitBoard64eoERKS_, null, !124, !2} ; [ DW_TAG_subprogram ] [line 55] [def] [scope 56] [operator^]
!152 = !{!"0x2e\00operator bool\00operator bool\00_ZN10BitBoard64cvbEv\0061\000\001\000\000\00256\000\0062", !1, !"_ZTS10BitBoard64", !130, null, i1 (%class.BitBoard64*)* @_ZN10BitBoard64cvbEv, null, !129, !2} ; [ DW_TAG_subprogram ] [line 61] [def] [scope 62] [operator bool]
!153 = !{!"0x2e\00setBit\00setBit\00_ZN10BitBoard646setBitEi\0066\000\001\000\000\00256\000\0067", !1, !"_ZTS10BitBoard64", !112, null, void (%class.BitBoard64*, i32)* @_ZN10BitBoard646setBitEi, null, !111, !2} ; [ DW_TAG_subprogram ] [line 66] [def] [scope 67] [setBit]
!154 = !{!"0x2e\00unSetBit\00unSetBit\00_ZN10BitBoard648unSetBitEi\0077\000\001\000\000\00256\000\0078", !1, !"_ZTS10BitBoard64", !112, null, void (%class.BitBoard64*, i32)* @_ZN10BitBoard648unSetBitEi, null, !114, !2} ; [ DW_TAG_subprogram ] [line 77] [def] [scope 78] [unSetBit]
!155 = !{!"0x2e\00getBit\00getBit\00_ZN10BitBoard646getBitEi\0088\000\001\000\000\00256\000\0089", !1, !"_ZTS10BitBoard64", !116, null, i32 (%class.BitBoard64*, i32)* @_ZN10BitBoard646getBitEi, null, !115, !2} ; [ DW_TAG_subprogram ] [line 88] [def] [scope 89] [getBit]
!156 = !{!"0x2e\00readFromFile\00readFromFile\00_ZN10BitBoard6412readFromFileEP8_IO_FILE\0099\000\001\000\000\00256\000\00100", !1, !"_ZTS10BitBoard64", !134, null, i32 (%class.BitBoard64*, %struct._IO_FILE*)* @_ZN10BitBoard6412readFromFileEP8_IO_FILE, null, !133, !2} ; [ DW_TAG_subprogram ] [line 99] [def] [scope 100] [readFromFile]
!157 = !{!"0x2e\00writeToFile\00writeToFile\00_ZN10BitBoard6411writeToFileEP8_IO_FILE\00129\000\001\000\000\00256\000\00130", !1, !"_ZTS10BitBoard64", !134, null, i32 (%class.BitBoard64*, %struct._IO_FILE*)* @_ZN10BitBoard6411writeToFileEP8_IO_FILE, null, !139, !2} ; [ DW_TAG_subprogram ] [line 129] [def] [scope 130] [writeToFile]
!158 = !{!"0x2e\00getBFP\00getBFP\00_Z6getBFPii\00160\000\001\000\000\00256\000\00161", !1, !159, !160, null, i32 (i32, i32)* @_Z6getBFPii, null, null, !2} ; [ DW_TAG_subprogram ] [line 160] [def] [scope 161] [getBFP]
!159 = !{!"0x29", !1}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!160 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !161, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!161 = !{!8, !8, !8}
!162 = !{!"0x2e\00print\00print\00_ZN10BitBoard645printEv\00191\000\001\000\000\00256\000\00192", !1, !"_ZTS10BitBoard64", !105, null, void (%class.BitBoard64*)* @_ZN10BitBoard645printEv, null, !132, !2} ; [ DW_TAG_subprogram ] [line 191] [def] [scope 192] [print]
!163 = !{!"0x2e\00BitBoard64\00BitBoard64\00_ZN10BitBoard64C2Ejj\0035\000\001\000\000\00256\000\0035", !98, !"_ZTS10BitBoard64", !109, null, void (%class.BitBoard64*, i32, i32)* @_ZN10BitBoard64C2Ejj, null, !108, !2} ; [ DW_TAG_subprogram ] [line 35] [def] [BitBoard64]
!164 = !{!"0x2e\00\00\00_GLOBAL__sub_I_bitboard64.cpp\000\001\001\000\000\0064\000\000", !1, !159, !165, null, void ()* @_GLOBAL__sub_I_bitboard64.cpp, null, null, !2} ; [ DW_TAG_subprogram ] [line 0] [local] [def]
!165 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !2, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!166 = !{!167}
!167 = !{!"0x34\00__ioinit\00__ioinit\00_ZStL8__ioinit\0074\001\001", !83, !144, !"_ZTSNSt8ios_base4InitE", %"class.std::ios_base::Init"* @_ZStL8__ioinit, null} ; [ DW_TAG_variable ] [__ioinit] [line 74] [local] [def]
!168 = !{!169, !172, !174, !179, !185, !193, !197, !204, !208, !212, !214, !216, !220, !229, !233, !239, !245, !247, !251, !255, !259, !263, !269, !271, !275, !279, !283, !285, !290, !294, !298, !300, !302, !306, !313, !317, !321, !325, !327, !333, !335, !342, !347, !351, !355, !359, !363, !367, !369, !371, !375, !379, !383, !385, !389, !393, !395, !397, !401, !408, !413, !418, !419, !420, !421, !425, !426, !431, !436, !442, !444, !446, !448, !450, !452, !454, !456, !458, !460, !462, !464, !466, !468, !470, !476, !478, !479, !482, !484, !486, !488, !492, !494, !496, !498, !500, !502, !504, !506, !508, !512, !516, !518, !522, !526}
!169 = !{!"0x8\0064\00", !83, !170}               ; [ DW_TAG_imported_declaration ]
!170 = !{!"0x16\00mbstate_t\00106\000\000\000\000", !5, null, !171} ; [ DW_TAG_typedef ] [mbstate_t] [line 106, size 0, align 0, offset 0] [from __mbstate_t]
!171 = !{!"0x16\00__mbstate_t\0094\000\000\000\000", !5, null, !"_ZTS11__mbstate_t"} ; [ DW_TAG_typedef ] [__mbstate_t] [line 94, size 0, align 0, offset 0] [from _ZTS11__mbstate_t]
!172 = !{!"0x8\00139\00", !83, !173}              ; [ DW_TAG_imported_declaration ]
!173 = !{!"0x16\00wint_t\00132\000\000\000\000", !65, null, !13} ; [ DW_TAG_typedef ] [wint_t] [line 132, size 0, align 0, offset 0] [from unsigned int]
!174 = !{!"0x8\00141\00", !83, !175}              ; [ DW_TAG_imported_declaration ]
!175 = !{!"0x2e\00btowc\00btowc\00\00353\000\000\000\000\00256\000\000", !5, !176, !177, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 353] [scope 0] [btowc]
!176 = !{!"0x29", !5}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon//usr/include/wchar.h]
!177 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !178, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!178 = !{!173, !8}
!179 = !{!"0x8\00142\00", !83, !180}              ; [ DW_TAG_imported_declaration ]
!180 = !{!"0x2e\00fgetwc\00fgetwc\00\00745\000\000\000\000\00256\000\000", !5, !176, !181, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 745] [scope 0] [fgetwc]
!181 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !182, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!182 = !{!173, !183}
!183 = !{!"0xf\00\000\0064\0064\000\000", null, null, !184} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from __FILE]
!184 = !{!"0x16\00__FILE\0064\000\000\000\000", !138, null, !"_ZTS8_IO_FILE"} ; [ DW_TAG_typedef ] [__FILE] [line 64, size 0, align 0, offset 0] [from _ZTS8_IO_FILE]
!185 = !{!"0x8\00143\00", !83, !186}              ; [ DW_TAG_imported_declaration ]
!186 = !{!"0x2e\00fgetws\00fgetws\00\00774\000\000\000\000\00256\000\000", !5, !176, !187, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 774] [scope 0] [fgetws]
!187 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !188, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!188 = !{!189, !191, !8, !192}
!189 = !{!"0xf\00\000\0064\0064\000\000", null, null, !190} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from wchar_t]
!190 = !{!"0x24\00wchar_t\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [wchar_t] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!191 = !{!"0x37\00\000\000\000\000\000", null, null, !189} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!192 = !{!"0x37\00\000\000\000\000\000", null, null, !183} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!193 = !{!"0x8\00144\00", !83, !194}              ; [ DW_TAG_imported_declaration ]
!194 = !{!"0x2e\00fputwc\00fputwc\00\00759\000\000\000\000\00256\000\000", !5, !176, !195, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 759] [scope 0] [fputwc]
!195 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !196, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!196 = !{!173, !190, !183}
!197 = !{!"0x8\00145\00", !83, !198}              ; [ DW_TAG_imported_declaration ]
!198 = !{!"0x2e\00fputws\00fputws\00\00781\000\000\000\000\00256\000\000", !5, !176, !199, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 781] [scope 0] [fputws]
!199 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !200, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!200 = !{!8, !201, !192}
!201 = !{!"0x37\00\000\000\000\000\000", null, null, !202} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!202 = !{!"0xf\00\000\0064\0064\000\000", null, null, !203} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!203 = !{!"0x26\00\000\000\000\000\000", null, null, !190} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from wchar_t]
!204 = !{!"0x8\00146\00", !83, !205}              ; [ DW_TAG_imported_declaration ]
!205 = !{!"0x2e\00fwide\00fwide\00\00587\000\000\000\000\00256\000\000", !5, !176, !206, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 587] [scope 0] [fwide]
!206 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !207, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!207 = !{!8, !183, !8}
!208 = !{!"0x8\00147\00", !83, !209}              ; [ DW_TAG_imported_declaration ]
!209 = !{!"0x2e\00fwprintf\00fwprintf\00\00594\000\000\000\000\00256\000\000", !5, !176, !210, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 594] [scope 0] [fwprintf]
!210 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !211, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!211 = !{!8, !192, !201, null}
!212 = !{!"0x8\00148\00", !83, !213}              ; [ DW_TAG_imported_declaration ]
!213 = !{!"0x2e\00fwscanf\00fwscanf\00\00635\000\000\000\000\00256\000\000", !5, !176, !210, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 635] [scope 0] [fwscanf]
!214 = !{!"0x8\00149\00", !83, !215}              ; [ DW_TAG_imported_declaration ]
!215 = !{!"0x2e\00getwc\00getwc\00\00746\000\000\000\000\00256\000\000", !5, !176, !181, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 746] [scope 0] [getwc]
!216 = !{!"0x8\00150\00", !83, !217}              ; [ DW_TAG_imported_declaration ]
!217 = !{!"0x2e\00getwchar\00getwchar\00\00752\000\000\000\000\00256\000\000", !5, !176, !218, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 752] [scope 0] [getwchar]
!218 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !219, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!219 = !{!173}
!220 = !{!"0x8\00151\00", !83, !221}              ; [ DW_TAG_imported_declaration ]
!221 = !{!"0x2e\00mbrlen\00mbrlen\00\00376\000\000\000\000\00256\000\000", !5, !176, !222, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 376] [scope 0] [mbrlen]
!222 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !223, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!223 = !{!64, !224, !64, !227}
!224 = !{!"0x37\00\000\000\000\000\000", null, null, !225} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!225 = !{!"0xf\00\000\0064\0064\000\000", null, null, !226} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!226 = !{!"0x26\00\000\000\000\000\000", null, null, !16} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!227 = !{!"0x37\00\000\000\000\000\000", null, null, !228} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!228 = !{!"0xf\00\000\0064\0064\000\000", null, null, !170} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from mbstate_t]
!229 = !{!"0x8\00152\00", !83, !230}              ; [ DW_TAG_imported_declaration ]
!230 = !{!"0x2e\00mbrtowc\00mbrtowc\00\00365\000\000\000\000\00256\000\000", !5, !176, !231, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 365] [scope 0] [mbrtowc]
!231 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !232, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!232 = !{!64, !191, !224, !64, !227}
!233 = !{!"0x8\00153\00", !83, !234}              ; [ DW_TAG_imported_declaration ]
!234 = !{!"0x2e\00mbsinit\00mbsinit\00\00361\000\000\000\000\00256\000\000", !5, !176, !235, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 361] [scope 0] [mbsinit]
!235 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !236, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!236 = !{!8, !237}
!237 = !{!"0xf\00\000\0064\0064\000\000", null, null, !238} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!238 = !{!"0x26\00\000\000\000\000\000", null, null, !170} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from mbstate_t]
!239 = !{!"0x8\00154\00", !83, !240}              ; [ DW_TAG_imported_declaration ]
!240 = !{!"0x2e\00mbsrtowcs\00mbsrtowcs\00\00408\000\000\000\000\00256\000\000", !5, !176, !241, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 408] [scope 0] [mbsrtowcs]
!241 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !242, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!242 = !{!64, !191, !243, !64, !227}
!243 = !{!"0x37\00\000\000\000\000\000", null, null, !244} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!244 = !{!"0xf\00\000\0064\0064\000\000", null, null, !225} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!245 = !{!"0x8\00155\00", !83, !246}              ; [ DW_TAG_imported_declaration ]
!246 = !{!"0x2e\00putwc\00putwc\00\00760\000\000\000\000\00256\000\000", !5, !176, !195, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 760] [scope 0] [putwc]
!247 = !{!"0x8\00156\00", !83, !248}              ; [ DW_TAG_imported_declaration ]
!248 = !{!"0x2e\00putwchar\00putwchar\00\00766\000\000\000\000\00256\000\000", !5, !176, !249, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 766] [scope 0] [putwchar]
!249 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !250, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!250 = !{!173, !190}
!251 = !{!"0x8\00158\00", !83, !252}              ; [ DW_TAG_imported_declaration ]
!252 = !{!"0x2e\00swprintf\00swprintf\00\00604\000\000\000\000\00256\000\000", !5, !176, !253, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 604] [scope 0] [swprintf]
!253 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !254, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!254 = !{!8, !191, !64, !201, null}
!255 = !{!"0x8\00160\00", !83, !256}              ; [ DW_TAG_imported_declaration ]
!256 = !{!"0x2e\00swscanf\00swscanf\00\00645\000\000\000\000\00256\000\000", !5, !176, !257, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 645] [scope 0] [swscanf]
!257 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !258, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!258 = !{!8, !201, !201, null}
!259 = !{!"0x8\00161\00", !83, !260}              ; [ DW_TAG_imported_declaration ]
!260 = !{!"0x2e\00ungetwc\00ungetwc\00\00789\000\000\000\000\00256\000\000", !5, !176, !261, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 789] [scope 0] [ungetwc]
!261 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !262, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!262 = !{!173, !173, !183}
!263 = !{!"0x8\00162\00", !83, !264}              ; [ DW_TAG_imported_declaration ]
!264 = !{!"0x2e\00vfwprintf\00vfwprintf\00\00612\000\000\000\000\00256\000\000", !5, !176, !265, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 612] [scope 0] [vfwprintf]
!265 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !266, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!266 = !{!8, !192, !201, !267}
!267 = !{!"0xf\00\000\0064\0064\000\000", null, null, !268} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from __va_list_tag]
!268 = !{!"0x16\00__va_list_tag\000\000\000\000\000", !1, null, !"_ZTS13__va_list_tag"} ; [ DW_TAG_typedef ] [__va_list_tag] [line 0, size 0, align 0, offset 0] [from _ZTS13__va_list_tag]
!269 = !{!"0x8\00164\00", !83, !270}              ; [ DW_TAG_imported_declaration ]
!270 = !{!"0x2e\00vfwscanf\00vfwscanf\00\00689\000\000\000\000\00256\000\000", !5, !176, !265, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 689] [scope 0] [vfwscanf]
!271 = !{!"0x8\00167\00", !83, !272}              ; [ DW_TAG_imported_declaration ]
!272 = !{!"0x2e\00vswprintf\00vswprintf\00\00625\000\000\000\000\00256\000\000", !5, !176, !273, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 625] [scope 0] [vswprintf]
!273 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !274, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!274 = !{!8, !191, !64, !201, !267}
!275 = !{!"0x8\00170\00", !83, !276}              ; [ DW_TAG_imported_declaration ]
!276 = !{!"0x2e\00vswscanf\00vswscanf\00\00701\000\000\000\000\00256\000\000", !5, !176, !277, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 701] [scope 0] [vswscanf]
!277 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !278, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!278 = !{!8, !201, !201, !267}
!279 = !{!"0x8\00172\00", !83, !280}              ; [ DW_TAG_imported_declaration ]
!280 = !{!"0x2e\00vwprintf\00vwprintf\00\00620\000\000\000\000\00256\000\000", !5, !176, !281, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 620] [scope 0] [vwprintf]
!281 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !282, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!282 = !{!8, !201, !267}
!283 = !{!"0x8\00174\00", !83, !284}              ; [ DW_TAG_imported_declaration ]
!284 = !{!"0x2e\00vwscanf\00vwscanf\00\00697\000\000\000\000\00256\000\000", !5, !176, !281, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 697] [scope 0] [vwscanf]
!285 = !{!"0x8\00176\00", !83, !286}              ; [ DW_TAG_imported_declaration ]
!286 = !{!"0x2e\00wcrtomb\00wcrtomb\00\00370\000\000\000\000\00256\000\000", !5, !176, !287, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 370] [scope 0] [wcrtomb]
!287 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !288, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!288 = !{!64, !289, !190, !227}
!289 = !{!"0x37\00\000\000\000\000\000", null, null, !24} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!290 = !{!"0x8\00177\00", !83, !291}              ; [ DW_TAG_imported_declaration ]
!291 = !{!"0x2e\00wcscat\00wcscat\00\00155\000\000\000\000\00256\000\000", !5, !176, !292, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 155] [scope 0] [wcscat]
!292 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !293, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!293 = !{!189, !191, !201}
!294 = !{!"0x8\00178\00", !83, !295}              ; [ DW_TAG_imported_declaration ]
!295 = !{!"0x2e\00wcscmp\00wcscmp\00\00163\000\000\000\000\00256\000\000", !5, !176, !296, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 163] [scope 0] [wcscmp]
!296 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !297, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!297 = !{!8, !202, !202}
!298 = !{!"0x8\00179\00", !83, !299}              ; [ DW_TAG_imported_declaration ]
!299 = !{!"0x2e\00wcscoll\00wcscoll\00\00192\000\000\000\000\00256\000\000", !5, !176, !296, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 192] [scope 0] [wcscoll]
!300 = !{!"0x8\00180\00", !83, !301}              ; [ DW_TAG_imported_declaration ]
!301 = !{!"0x2e\00wcscpy\00wcscpy\00\00147\000\000\000\000\00256\000\000", !5, !176, !292, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 147] [scope 0] [wcscpy]
!302 = !{!"0x8\00181\00", !83, !303}              ; [ DW_TAG_imported_declaration ]
!303 = !{!"0x2e\00wcscspn\00wcscspn\00\00252\000\000\000\000\00256\000\000", !5, !176, !304, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 252] [scope 0] [wcscspn]
!304 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !305, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!305 = !{!64, !202, !202}
!306 = !{!"0x8\00182\00", !83, !307}              ; [ DW_TAG_imported_declaration ]
!307 = !{!"0x2e\00wcsftime\00wcsftime\00\00855\000\000\000\000\00256\000\000", !5, !176, !308, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 855] [scope 0] [wcsftime]
!308 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !309, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!309 = !{!64, !191, !64, !201, !310}
!310 = !{!"0x37\00\000\000\000\000\000", null, null, !311} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!311 = !{!"0xf\00\000\0064\0064\000\000", null, null, !312} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!312 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS2tm"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS2tm]
!313 = !{!"0x8\00183\00", !83, !314}              ; [ DW_TAG_imported_declaration ]
!314 = !{!"0x2e\00wcslen\00wcslen\00\00287\000\000\000\000\00256\000\000", !5, !176, !315, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 287] [scope 0] [wcslen]
!315 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !316, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!316 = !{!64, !202}
!317 = !{!"0x8\00184\00", !83, !318}              ; [ DW_TAG_imported_declaration ]
!318 = !{!"0x2e\00wcsncat\00wcsncat\00\00158\000\000\000\000\00256\000\000", !5, !176, !319, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 158] [scope 0] [wcsncat]
!319 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !320, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!320 = !{!189, !191, !201, !64}
!321 = !{!"0x8\00185\00", !83, !322}              ; [ DW_TAG_imported_declaration ]
!322 = !{!"0x2e\00wcsncmp\00wcsncmp\00\00166\000\000\000\000\00256\000\000", !5, !176, !323, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 166] [scope 0] [wcsncmp]
!323 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !324, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!324 = !{!8, !202, !202, !64}
!325 = !{!"0x8\00186\00", !83, !326}              ; [ DW_TAG_imported_declaration ]
!326 = !{!"0x2e\00wcsncpy\00wcsncpy\00\00150\000\000\000\000\00256\000\000", !5, !176, !319, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 150] [scope 0] [wcsncpy]
!327 = !{!"0x8\00187\00", !83, !328}              ; [ DW_TAG_imported_declaration ]
!328 = !{!"0x2e\00wcsrtombs\00wcsrtombs\00\00414\000\000\000\000\00256\000\000", !5, !176, !329, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 414] [scope 0] [wcsrtombs]
!329 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !330, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!330 = !{!64, !289, !331, !64, !227}
!331 = !{!"0x37\00\000\000\000\000\000", null, null, !332} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!332 = !{!"0xf\00\000\0064\0064\000\000", null, null, !202} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!333 = !{!"0x8\00188\00", !83, !334}              ; [ DW_TAG_imported_declaration ]
!334 = !{!"0x2e\00wcsspn\00wcsspn\00\00256\000\000\000\000\00256\000\000", !5, !176, !304, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 256] [scope 0] [wcsspn]
!335 = !{!"0x8\00189\00", !83, !336}              ; [ DW_TAG_imported_declaration ]
!336 = !{!"0x2e\00wcstod\00wcstod\00\00450\000\000\000\000\00256\000\000", !5, !176, !337, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 450] [scope 0] [wcstod]
!337 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !338, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!338 = !{!339, !201, !340}
!339 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!340 = !{!"0x37\00\000\000\000\000\000", null, null, !341} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!341 = !{!"0xf\00\000\0064\0064\000\000", null, null, !189} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!342 = !{!"0x8\00191\00", !83, !343}              ; [ DW_TAG_imported_declaration ]
!343 = !{!"0x2e\00wcstof\00wcstof\00\00457\000\000\000\000\00256\000\000", !5, !176, !344, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 457] [scope 0] [wcstof]
!344 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !345, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!345 = !{!346, !201, !340}
!346 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!347 = !{!"0x8\00193\00", !83, !348}              ; [ DW_TAG_imported_declaration ]
!348 = !{!"0x2e\00wcstok\00wcstok\00\00282\000\000\000\000\00256\000\000", !5, !176, !349, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 282] [scope 0] [wcstok]
!349 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !350, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!350 = !{!189, !191, !201, !340}
!351 = !{!"0x8\00194\00", !83, !352}              ; [ DW_TAG_imported_declaration ]
!352 = !{!"0x2e\00wcstol\00wcstol\00\00468\000\000\000\000\00256\000\000", !5, !176, !353, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 468] [scope 0] [wcstol]
!353 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !354, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!354 = !{!44, !201, !340, !8}
!355 = !{!"0x8\00195\00", !83, !356}              ; [ DW_TAG_imported_declaration ]
!356 = !{!"0x2e\00wcstoul\00wcstoul\00\00473\000\000\000\000\00256\000\000", !5, !176, !357, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 473] [scope 0] [wcstoul]
!357 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !358, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!358 = !{!66, !201, !340, !8}
!359 = !{!"0x8\00196\00", !83, !360}              ; [ DW_TAG_imported_declaration ]
!360 = !{!"0x2e\00wcsxfrm\00wcsxfrm\00\00196\000\000\000\000\00256\000\000", !5, !176, !361, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 196] [scope 0] [wcsxfrm]
!361 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !362, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!362 = !{!64, !191, !201, !64}
!363 = !{!"0x8\00197\00", !83, !364}              ; [ DW_TAG_imported_declaration ]
!364 = !{!"0x2e\00wctob\00wctob\00\00357\000\000\000\000\00256\000\000", !5, !176, !365, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 357] [scope 0] [wctob]
!365 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !366, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!366 = !{!8, !173}
!367 = !{!"0x8\00198\00", !83, !368}              ; [ DW_TAG_imported_declaration ]
!368 = !{!"0x2e\00wmemcmp\00wmemcmp\00\00325\000\000\000\000\00256\000\000", !5, !176, !323, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 325] [scope 0] [wmemcmp]
!369 = !{!"0x8\00199\00", !83, !370}              ; [ DW_TAG_imported_declaration ]
!370 = !{!"0x2e\00wmemcpy\00wmemcpy\00\00329\000\000\000\000\00256\000\000", !5, !176, !319, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 329] [scope 0] [wmemcpy]
!371 = !{!"0x8\00200\00", !83, !372}              ; [ DW_TAG_imported_declaration ]
!372 = !{!"0x2e\00wmemmove\00wmemmove\00\00334\000\000\000\000\00256\000\000", !5, !176, !373, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 334] [scope 0] [wmemmove]
!373 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !374, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!374 = !{!189, !189, !202, !64}
!375 = !{!"0x8\00201\00", !83, !376}              ; [ DW_TAG_imported_declaration ]
!376 = !{!"0x2e\00wmemset\00wmemset\00\00338\000\000\000\000\00256\000\000", !5, !176, !377, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 338] [scope 0] [wmemset]
!377 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !378, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!378 = !{!189, !189, !190, !64}
!379 = !{!"0x8\00202\00", !83, !380}              ; [ DW_TAG_imported_declaration ]
!380 = !{!"0x2e\00wprintf\00wprintf\00\00601\000\000\000\000\00256\000\000", !5, !176, !381, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 601] [scope 0] [wprintf]
!381 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !382, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!382 = !{!8, !201, null}
!383 = !{!"0x8\00203\00", !83, !384}              ; [ DW_TAG_imported_declaration ]
!384 = !{!"0x2e\00wscanf\00wscanf\00\00642\000\000\000\000\00256\000\000", !5, !176, !381, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 642] [scope 0] [wscanf]
!385 = !{!"0x8\00204\00", !83, !386}              ; [ DW_TAG_imported_declaration ]
!386 = !{!"0x2e\00wcschr\00wcschr\00\00227\000\000\000\000\00256\000\000", !5, !176, !387, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 227] [scope 0] [wcschr]
!387 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !388, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!388 = !{!189, !202, !190}
!389 = !{!"0x8\00205\00", !83, !390}              ; [ DW_TAG_imported_declaration ]
!390 = !{!"0x2e\00wcspbrk\00wcspbrk\00\00266\000\000\000\000\00256\000\000", !5, !176, !391, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 266] [scope 0] [wcspbrk]
!391 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !392, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!392 = !{!189, !202, !202}
!393 = !{!"0x8\00206\00", !83, !394}              ; [ DW_TAG_imported_declaration ]
!394 = !{!"0x2e\00wcsrchr\00wcsrchr\00\00237\000\000\000\000\00256\000\000", !5, !176, !387, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 237] [scope 0] [wcsrchr]
!395 = !{!"0x8\00207\00", !83, !396}              ; [ DW_TAG_imported_declaration ]
!396 = !{!"0x2e\00wcsstr\00wcsstr\00\00277\000\000\000\000\00256\000\000", !5, !176, !391, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 277] [scope 0] [wcsstr]
!397 = !{!"0x8\00208\00", !83, !398}              ; [ DW_TAG_imported_declaration ]
!398 = !{!"0x2e\00wmemchr\00wmemchr\00\00320\000\000\000\000\00256\000\000", !5, !176, !399, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 320] [scope 0] [wmemchr]
!399 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !400, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!400 = !{!189, !202, !190, !64}
!401 = !{!"0x8\00248\00", !402, !404}             ; [ DW_TAG_imported_declaration ]
!402 = !{!"0x39\00__gnu_cxx\00241", !403, null}   ; [ DW_TAG_namespace ] [__gnu_cxx] [line 241]
!403 = !{!"/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/cwchar", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!404 = !{!"0x2e\00wcstold\00wcstold\00\00459\000\000\000\000\00256\000\000", !5, !176, !405, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 459] [scope 0] [wcstold]
!405 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !406, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!406 = !{!407, !201, !340}
!407 = !{!"0x24\00long double\000\00128\00128\000\000\004", null, null} ; [ DW_TAG_base_type ] [long double] [line 0, size 128, align 128, offset 0, enc DW_ATE_float]
!408 = !{!"0x8\00257\00", !402, !409}             ; [ DW_TAG_imported_declaration ]
!409 = !{!"0x2e\00wcstoll\00wcstoll\00\00483\000\000\000\000\00256\000\000", !5, !176, !410, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 483] [scope 0] [wcstoll]
!410 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !411, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!411 = !{!412, !201, !340, !8}
!412 = !{!"0x24\00long long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!413 = !{!"0x8\00258\00", !402, !414}             ; [ DW_TAG_imported_declaration ]
!414 = !{!"0x2e\00wcstoull\00wcstoull\00\00490\000\000\000\000\00256\000\000", !5, !176, !415, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 490] [scope 0] [wcstoull]
!415 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !416, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!416 = !{!417, !201, !340, !8}
!417 = !{!"0x24\00long long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!418 = !{!"0x8\00264\00", !83, !404}              ; [ DW_TAG_imported_declaration ]
!419 = !{!"0x8\00265\00", !83, !409}              ; [ DW_TAG_imported_declaration ]
!420 = !{!"0x8\00266\00", !83, !414}              ; [ DW_TAG_imported_declaration ]
!421 = !{!"0x3a\0056\00", !422, !424}             ; [ DW_TAG_imported_module ]
!422 = !{!"0x39\00__gnu_debug\0054", !423, null}  ; [ DW_TAG_namespace ] [__gnu_debug] [line 54]
!423 = !{!"/usr/lib/gcc/x86_64-linux-gnu/4.8/../../../../include/c++/4.8/debug/debug.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!424 = !{!"0x39\00__debug\0048", !423, !83}       ; [ DW_TAG_namespace ] [__debug] [line 48]
!425 = !{!"0x8\0053\00", !83, !"_ZTS5lconv"}      ; [ DW_TAG_imported_declaration ]
!426 = !{!"0x8\0054\00", !83, !427}               ; [ DW_TAG_imported_declaration ]
!427 = !{!"0x2e\00setlocale\00setlocale\00\00124\000\000\000\000\00256\000\000", !80, !428, !429, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 124] [scope 0] [setlocale]
!428 = !{!"0x29", !80}                            ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon//usr/include/locale.h]
!429 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !430, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!430 = !{!24, !8, !225}
!431 = !{!"0x8\0055\00", !83, !432}               ; [ DW_TAG_imported_declaration ]
!432 = !{!"0x2e\00localeconv\00localeconv\00\00127\000\000\000\000\00256\000\000", !80, !428, !433, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 127] [scope 0] [localeconv]
!433 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !434, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!434 = !{!435}
!435 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS5lconv"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS5lconv]
!436 = !{!"0x8\0064\00", !83, !437}               ; [ DW_TAG_imported_declaration ]
!437 = !{!"0x2e\00isalnum\00isalnum\00\00110\000\000\000\000\00256\000\000", !438, !439, !440, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 110] [scope 0] [isalnum]
!438 = !{!"/usr/include/ctype.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!439 = !{!"0x29", !438}                           ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon//usr/include/ctype.h]
!440 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !441, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!441 = !{!8, !8}
!442 = !{!"0x8\0065\00", !83, !443}               ; [ DW_TAG_imported_declaration ]
!443 = !{!"0x2e\00isalpha\00isalpha\00\00111\000\000\000\000\00256\000\000", !438, !439, !440, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 111] [scope 0] [isalpha]
!444 = !{!"0x8\0066\00", !83, !445}               ; [ DW_TAG_imported_declaration ]
!445 = !{!"0x2e\00iscntrl\00iscntrl\00\00112\000\000\000\000\00256\000\000", !438, !439, !440, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 112] [scope 0] [iscntrl]
!446 = !{!"0x8\0067\00", !83, !447}               ; [ DW_TAG_imported_declaration ]
!447 = !{!"0x2e\00isdigit\00isdigit\00\00113\000\000\000\000\00256\000\000", !438, !439, !440, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 113] [scope 0] [isdigit]
!448 = !{!"0x8\0068\00", !83, !449}               ; [ DW_TAG_imported_declaration ]
!449 = !{!"0x2e\00isgraph\00isgraph\00\00115\000\000\000\000\00256\000\000", !438, !439, !440, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 115] [scope 0] [isgraph]
!450 = !{!"0x8\0069\00", !83, !451}               ; [ DW_TAG_imported_declaration ]
!451 = !{!"0x2e\00islower\00islower\00\00114\000\000\000\000\00256\000\000", !438, !439, !440, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 114] [scope 0] [islower]
!452 = !{!"0x8\0070\00", !83, !453}               ; [ DW_TAG_imported_declaration ]
!453 = !{!"0x2e\00isprint\00isprint\00\00116\000\000\000\000\00256\000\000", !438, !439, !440, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 116] [scope 0] [isprint]
!454 = !{!"0x8\0071\00", !83, !455}               ; [ DW_TAG_imported_declaration ]
!455 = !{!"0x2e\00ispunct\00ispunct\00\00117\000\000\000\000\00256\000\000", !438, !439, !440, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 117] [scope 0] [ispunct]
!456 = !{!"0x8\0072\00", !83, !457}               ; [ DW_TAG_imported_declaration ]
!457 = !{!"0x2e\00isspace\00isspace\00\00118\000\000\000\000\00256\000\000", !438, !439, !440, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 118] [scope 0] [isspace]
!458 = !{!"0x8\0073\00", !83, !459}               ; [ DW_TAG_imported_declaration ]
!459 = !{!"0x2e\00isupper\00isupper\00\00119\000\000\000\000\00256\000\000", !438, !439, !440, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 119] [scope 0] [isupper]
!460 = !{!"0x8\0074\00", !83, !461}               ; [ DW_TAG_imported_declaration ]
!461 = !{!"0x2e\00isxdigit\00isxdigit\00\00120\000\000\000\000\00256\000\000", !438, !439, !440, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 120] [scope 0] [isxdigit]
!462 = !{!"0x8\0075\00", !83, !463}               ; [ DW_TAG_imported_declaration ]
!463 = !{!"0x2e\00tolower\00tolower\00\00124\000\000\000\000\00256\000\000", !438, !439, !440, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 124] [scope 0] [tolower]
!464 = !{!"0x8\0076\00", !83, !465}               ; [ DW_TAG_imported_declaration ]
!465 = !{!"0x2e\00toupper\00toupper\00\00127\000\000\000\000\00256\000\000", !438, !439, !440, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 127] [scope 0] [toupper]
!466 = !{!"0x8\0044\00", !402, !467}              ; [ DW_TAG_imported_declaration ]
!467 = !{!"0x16\00size_t\00186\000\000\000\000", !84, !83, !66} ; [ DW_TAG_typedef ] [size_t] [line 186, size 0, align 0, offset 0] [from long unsigned int]
!468 = !{!"0x8\0045\00", !402, !469}              ; [ DW_TAG_imported_declaration ]
!469 = !{!"0x16\00ptrdiff_t\00187\000\000\000\000", !84, !83, !44} ; [ DW_TAG_typedef ] [ptrdiff_t] [line 187, size 0, align 0, offset 0] [from long int]
!470 = !{!"0x8\0082\00", !83, !471}               ; [ DW_TAG_imported_declaration ]
!471 = !{!"0x16\00wctrans_t\00186\000\000\000\000", !472, null, !473} ; [ DW_TAG_typedef ] [wctrans_t] [line 186, size 0, align 0, offset 0] [from ]
!472 = !{!"/usr/include/wctype.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!473 = !{!"0xf\00\000\0064\0064\000\000", null, null, !474} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!474 = !{!"0x26\00\000\000\000\000\000", null, null, !475} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from __int32_t]
!475 = !{!"0x16\00__int32_t\0040\000\000\000\000", !43, null, !8} ; [ DW_TAG_typedef ] [__int32_t] [line 40, size 0, align 0, offset 0] [from int]
!476 = !{!"0x8\0083\00", !83, !477}               ; [ DW_TAG_imported_declaration ]
!477 = !{!"0x16\00wctype_t\0052\000\000\000\000", !472, null, !66} ; [ DW_TAG_typedef ] [wctype_t] [line 52, size 0, align 0, offset 0] [from long unsigned int]
!478 = !{!"0x8\0084\00", !83, !173}               ; [ DW_TAG_imported_declaration ]
!479 = !{!"0x8\0086\00", !83, !480}               ; [ DW_TAG_imported_declaration ]
!480 = !{!"0x2e\00iswalnum\00iswalnum\00\00111\000\000\000\000\00256\000\000", !472, !481, !365, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 111] [scope 0] [iswalnum]
!481 = !{!"0x29", !472}                           ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon//usr/include/wctype.h]
!482 = !{!"0x8\0087\00", !83, !483}               ; [ DW_TAG_imported_declaration ]
!483 = !{!"0x2e\00iswalpha\00iswalpha\00\00117\000\000\000\000\00256\000\000", !472, !481, !365, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 117] [scope 0] [iswalpha]
!484 = !{!"0x8\0089\00", !83, !485}               ; [ DW_TAG_imported_declaration ]
!485 = !{!"0x2e\00iswblank\00iswblank\00\00162\000\000\000\000\00256\000\000", !472, !481, !365, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 162] [scope 0] [iswblank]
!486 = !{!"0x8\0091\00", !83, !487}               ; [ DW_TAG_imported_declaration ]
!487 = !{!"0x2e\00iswcntrl\00iswcntrl\00\00120\000\000\000\000\00256\000\000", !472, !481, !365, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 120] [scope 0] [iswcntrl]
!488 = !{!"0x8\0092\00", !83, !489}               ; [ DW_TAG_imported_declaration ]
!489 = !{!"0x2e\00iswctype\00iswctype\00\00175\000\000\000\000\00256\000\000", !472, !481, !490, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 175] [scope 0] [iswctype]
!490 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !491, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!491 = !{!8, !173, !477}
!492 = !{!"0x8\0093\00", !83, !493}               ; [ DW_TAG_imported_declaration ]
!493 = !{!"0x2e\00iswdigit\00iswdigit\00\00124\000\000\000\000\00256\000\000", !472, !481, !365, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 124] [scope 0] [iswdigit]
!494 = !{!"0x8\0094\00", !83, !495}               ; [ DW_TAG_imported_declaration ]
!495 = !{!"0x2e\00iswgraph\00iswgraph\00\00128\000\000\000\000\00256\000\000", !472, !481, !365, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 128] [scope 0] [iswgraph]
!496 = !{!"0x8\0095\00", !83, !497}               ; [ DW_TAG_imported_declaration ]
!497 = !{!"0x2e\00iswlower\00iswlower\00\00133\000\000\000\000\00256\000\000", !472, !481, !365, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 133] [scope 0] [iswlower]
!498 = !{!"0x8\0096\00", !83, !499}               ; [ DW_TAG_imported_declaration ]
!499 = !{!"0x2e\00iswprint\00iswprint\00\00136\000\000\000\000\00256\000\000", !472, !481, !365, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 136] [scope 0] [iswprint]
!500 = !{!"0x8\0097\00", !83, !501}               ; [ DW_TAG_imported_declaration ]
!501 = !{!"0x2e\00iswpunct\00iswpunct\00\00141\000\000\000\000\00256\000\000", !472, !481, !365, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 141] [scope 0] [iswpunct]
!502 = !{!"0x8\0098\00", !83, !503}               ; [ DW_TAG_imported_declaration ]
!503 = !{!"0x2e\00iswspace\00iswspace\00\00146\000\000\000\000\00256\000\000", !472, !481, !365, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 146] [scope 0] [iswspace]
!504 = !{!"0x8\0099\00", !83, !505}               ; [ DW_TAG_imported_declaration ]
!505 = !{!"0x2e\00iswupper\00iswupper\00\00151\000\000\000\000\00256\000\000", !472, !481, !365, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 151] [scope 0] [iswupper]
!506 = !{!"0x8\00100\00", !83, !507}              ; [ DW_TAG_imported_declaration ]
!507 = !{!"0x2e\00iswxdigit\00iswxdigit\00\00156\000\000\000\000\00256\000\000", !472, !481, !365, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 156] [scope 0] [iswxdigit]
!508 = !{!"0x8\00101\00", !83, !509}              ; [ DW_TAG_imported_declaration ]
!509 = !{!"0x2e\00towctrans\00towctrans\00\00221\000\000\000\000\00256\000\000", !472, !481, !510, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 221] [scope 0] [towctrans]
!510 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !511, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!511 = !{!173, !173, !471}
!512 = !{!"0x8\00102\00", !83, !513}              ; [ DW_TAG_imported_declaration ]
!513 = !{!"0x2e\00towlower\00towlower\00\00194\000\000\000\000\00256\000\000", !472, !481, !514, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 194] [scope 0] [towlower]
!514 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !515, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!515 = !{!173, !173}
!516 = !{!"0x8\00103\00", !83, !517}              ; [ DW_TAG_imported_declaration ]
!517 = !{!"0x2e\00towupper\00towupper\00\00197\000\000\000\000\00256\000\000", !472, !481, !514, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 197] [scope 0] [towupper]
!518 = !{!"0x8\00104\00", !83, !519}              ; [ DW_TAG_imported_declaration ]
!519 = !{!"0x2e\00wctrans\00wctrans\00\00218\000\000\000\000\00256\000\000", !472, !481, !520, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 218] [scope 0] [wctrans]
!520 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !521, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!521 = !{!471, !225}
!522 = !{!"0x8\00105\00", !83, !523}              ; [ DW_TAG_imported_declaration ]
!523 = !{!"0x2e\00wctype\00wctype\00\00171\000\000\000\000\00256\000\000", !472, !481, !524, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 171] [scope 0] [wctype]
!524 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !525, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!525 = !{!477, !225}
!526 = !{!"0x3a\0028\00", !0, !83}                ; [ DW_TAG_imported_module ]
!527 = !{i32 2, !"Dwarf Version", i32 4}
!528 = !{i32 2, !"Debug Info Version", i32 2}
!529 = !{!"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp", !0}
!530 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!531 = !MDLocation(line: 74, column: 25, scope: !142)
!532 = !{!"0x101\00this\0016777216\001088", !147, null, !533} ; [ DW_TAG_arg_variable ] [this] [line 0]
!533 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS10BitBoard64"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS10BitBoard64]
!534 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!535 = !MDLocation(line: 0, scope: !147)
!536 = !{!"0x100\00ret\0032\000", !147, !159, !"_ZTS10BitBoard64"} ; [ DW_TAG_auto_variable ] [ret] [line 32]
!537 = !MDLocation(line: 32, column: 13, scope: !147)
!538 = !MDLocation(line: 32, column: 18, scope: !147)
!539 = !MDLocation(line: 32, column: 17, scope: !147)
!540 = !MDLocation(line: 32, column: 28, scope: !147)
!541 = !MDLocation(line: 32, column: 27, scope: !147)
!542 = !MDLocation(line: 33, column: 2, scope: !147)
!543 = !{!"0x101\00this\0016777216\001088", !163, null, !533} ; [ DW_TAG_arg_variable ] [this] [line 0]
!544 = !MDLocation(line: 0, scope: !163)
!545 = !{!"0x101\00l\0033554467\000", !163, !546, !101} ; [ DW_TAG_arg_variable ] [l] [line 35]
!546 = !{!"0x29", !98}                            ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./bitboard64.h]
!547 = !MDLocation(line: 35, column: 22, scope: !163)
!548 = !{!"0x101\00h\0050331683\000", !163, !546, !101} ; [ DW_TAG_arg_variable ] [h] [line 35]
!549 = !MDLocation(line: 35, column: 34, scope: !163)
!550 = !MDLocation(line: 35, column: 48, scope: !551)
!551 = !{!"0xb\0035\0037\0049", !98, !163}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./bitboard64.h]
!552 = !MDLocation(line: 35, column: 38, scope: !551)
!553 = !MDLocation(line: 35, column: 62, scope: !551)
!554 = !MDLocation(line: 35, column: 64, scope: !163)
!555 = !{!"0x101\00this\0016777216\001088", !148, null, !533} ; [ DW_TAG_arg_variable ] [this] [line 0]
!556 = !MDLocation(line: 0, scope: !148)
!557 = !{!"0x101\00right\0033554468\000", !148, !159, !121} ; [ DW_TAG_arg_variable ] [right] [line 36]
!558 = !MDLocation(line: 36, column: 52, scope: !148)
!559 = !{!"0x100\00ret\0038\000", !148, !159, !"_ZTS10BitBoard64"} ; [ DW_TAG_auto_variable ] [ret] [line 38]
!560 = !MDLocation(line: 38, column: 13, scope: !148)
!561 = !MDLocation(line: 38, column: 17, scope: !148)
!562 = !MDLocation(line: 38, column: 27, scope: !148)
!563 = !MDLocation(line: 38, column: 42, scope: !148)
!564 = !MDLocation(line: 38, column: 53, scope: !148)
!565 = !MDLocation(line: 39, column: 2, scope: !148)
!566 = !{!"0x101\00this\0016777216\001088", !149, null, !533} ; [ DW_TAG_arg_variable ] [this] [line 0]
!567 = !MDLocation(line: 0, scope: !149)
!568 = !{!"0x101\00right\0033554474\000", !149, !159, !121} ; [ DW_TAG_arg_variable ] [right] [line 42]
!569 = !MDLocation(line: 42, column: 52, scope: !149)
!570 = !{!"0x100\00ret\0044\000", !149, !159, !"_ZTS10BitBoard64"} ; [ DW_TAG_auto_variable ] [ret] [line 44]
!571 = !MDLocation(line: 44, column: 13, scope: !149)
!572 = !MDLocation(line: 44, column: 17, scope: !149)
!573 = !MDLocation(line: 44, column: 27, scope: !149)
!574 = !MDLocation(line: 44, column: 42, scope: !149)
!575 = !MDLocation(line: 44, column: 53, scope: !149)
!576 = !MDLocation(line: 45, column: 2, scope: !149)
!577 = !{!"0x101\00this\0016777216\001088", !150, null, !533} ; [ DW_TAG_arg_variable ] [this] [line 0]
!578 = !MDLocation(line: 0, scope: !150)
!579 = !{!"0x101\00right\0033554480\000", !150, !159, !121} ; [ DW_TAG_arg_variable ] [right] [line 48]
!580 = !MDLocation(line: 48, column: 52, scope: !150)
!581 = !MDLocation(line: 50, column: 12, scope: !150)
!582 = !MDLocation(line: 50, column: 2, scope: !150)
!583 = !MDLocation(line: 51, column: 13, scope: !150)
!584 = !MDLocation(line: 51, column: 2, scope: !150)
!585 = !MDLocation(line: 52, column: 2, scope: !150)
!586 = !{!"0x101\00this\0016777216\001088", !151, null, !533} ; [ DW_TAG_arg_variable ] [this] [line 0]
!587 = !MDLocation(line: 0, scope: !151)
!588 = !{!"0x101\00right\0033554487\000", !151, !159, !121} ; [ DW_TAG_arg_variable ] [right] [line 55]
!589 = !MDLocation(line: 55, column: 52, scope: !151)
!590 = !{!"0x100\00ret\0057\000", !151, !159, !"_ZTS10BitBoard64"} ; [ DW_TAG_auto_variable ] [ret] [line 57]
!591 = !MDLocation(line: 57, column: 13, scope: !151)
!592 = !MDLocation(line: 57, column: 17, scope: !151)
!593 = !MDLocation(line: 57, column: 27, scope: !151)
!594 = !MDLocation(line: 57, column: 42, scope: !151)
!595 = !MDLocation(line: 57, column: 53, scope: !151)
!596 = !MDLocation(line: 58, column: 2, scope: !151)
!597 = !{!"0x101\00this\0016777216\001088", !152, null, !533} ; [ DW_TAG_arg_variable ] [this] [line 0]
!598 = !MDLocation(line: 0, scope: !152)
!599 = !MDLocation(line: 63, column: 16, scope: !152)
!600 = !MDLocation(line: 63, column: 27, scope: !601)
!601 = !{!"0xb\002", !1, !152}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!602 = !MDLocation(line: 63, column: 2, scope: !603)
!603 = !{!"0xb\003", !1, !604}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!604 = !{!"0xb\001", !1, !152}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!605 = !{!"0x101\00this\0016777216\001088", !153, null, !533} ; [ DW_TAG_arg_variable ] [this] [line 0]
!606 = !MDLocation(line: 0, scope: !153)
!607 = !{!"0x101\00bit\0033554498\000", !153, !159, !8} ; [ DW_TAG_arg_variable ] [bit] [line 66]
!608 = !MDLocation(line: 66, column: 29, scope: !153)
!609 = !MDLocation(line: 68, column: 6, scope: !610)
!610 = !{!"0xb\0068\005\000", !1, !153}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!611 = !MDLocation(line: 68, column: 5, scope: !153)
!612 = !MDLocation(line: 68, column: 19, scope: !613)
!613 = !{!"0xb\001", !1, !610}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!614 = !MDLocation(line: 69, column: 3, scope: !610)
!615 = !MDLocation(line: 71, column: 5, scope: !616)
!616 = !{!"0xb\0071\005\001", !1, !153}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!617 = !MDLocation(line: 71, column: 5, scope: !153)
!618 = !MDLocation(line: 72, column: 20, scope: !616)
!619 = !MDLocation(line: 72, column: 15, scope: !616)
!620 = !MDLocation(line: 72, column: 3, scope: !616)
!621 = !MDLocation(line: 74, column: 22, scope: !616)
!622 = !MDLocation(line: 74, column: 16, scope: !616)
!623 = !MDLocation(line: 74, column: 3, scope: !616)
!624 = !MDLocation(line: 75, column: 1, scope: !153)
!625 = !{!"0x101\00this\0016777216\001088", !154, null, !533} ; [ DW_TAG_arg_variable ] [this] [line 0]
!626 = !MDLocation(line: 0, scope: !154)
!627 = !{!"0x101\00bit\0033554509\000", !154, !159, !8} ; [ DW_TAG_arg_variable ] [bit] [line 77]
!628 = !MDLocation(line: 77, column: 31, scope: !154)
!629 = !MDLocation(line: 79, column: 6, scope: !630)
!630 = !{!"0xb\0079\005\002", !1, !154}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!631 = !MDLocation(line: 79, column: 5, scope: !154)
!632 = !MDLocation(line: 79, column: 19, scope: !633)
!633 = !{!"0xb\001", !1, !630}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!634 = !MDLocation(line: 80, column: 3, scope: !630)
!635 = !MDLocation(line: 82, column: 5, scope: !636)
!636 = !{!"0xb\0082\005\003", !1, !154}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!637 = !MDLocation(line: 82, column: 5, scope: !154)
!638 = !MDLocation(line: 83, column: 21, scope: !636)
!639 = !MDLocation(line: 83, column: 16, scope: !636)
!640 = !MDLocation(line: 83, column: 14, scope: !636)
!641 = !MDLocation(line: 83, column: 3, scope: !636)
!642 = !MDLocation(line: 85, column: 23, scope: !636)
!643 = !MDLocation(line: 85, column: 17, scope: !636)
!644 = !MDLocation(line: 85, column: 15, scope: !636)
!645 = !MDLocation(line: 85, column: 3, scope: !636)
!646 = !MDLocation(line: 86, column: 1, scope: !154)
!647 = !{!"0x101\00this\0016777216\001088", !155, null, !533} ; [ DW_TAG_arg_variable ] [this] [line 0]
!648 = !MDLocation(line: 0, scope: !155)
!649 = !{!"0x101\00bit\0033554520\000", !155, !159, !8} ; [ DW_TAG_arg_variable ] [bit] [line 88]
!650 = !MDLocation(line: 88, column: 28, scope: !155)
!651 = !MDLocation(line: 90, column: 6, scope: !652)
!652 = !{!"0xb\0090\005\004", !1, !155}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!653 = !MDLocation(line: 90, column: 5, scope: !155)
!654 = !MDLocation(line: 90, column: 19, scope: !655)
!655 = !{!"0xb\001", !1, !652}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!656 = !MDLocation(line: 91, column: 3, scope: !652)
!657 = !MDLocation(line: 93, column: 5, scope: !658)
!658 = !{!"0xb\0093\005\005", !1, !155}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!659 = !MDLocation(line: 93, column: 5, scope: !155)
!660 = !MDLocation(line: 94, column: 10, scope: !658)
!661 = !MDLocation(line: 94, column: 26, scope: !658)
!662 = !MDLocation(line: 94, column: 21, scope: !658)
!663 = !MDLocation(line: 94, column: 3, scope: !658)
!664 = !MDLocation(line: 96, column: 10, scope: !658)
!665 = !MDLocation(line: 96, column: 28, scope: !658)
!666 = !MDLocation(line: 96, column: 22, scope: !658)
!667 = !MDLocation(line: 96, column: 3, scope: !658)
!668 = !MDLocation(line: 97, column: 1, scope: !155)
!669 = !{!"0x101\00this\0016777216\001088", !156, null, !533} ; [ DW_TAG_arg_variable ] [this] [line 0]
!670 = !MDLocation(line: 0, scope: !156)
!671 = !{!"0x101\00file\0033554531\000", !156, !159, !136} ; [ DW_TAG_arg_variable ] [file] [line 99]
!672 = !MDLocation(line: 99, column: 36, scope: !156)
!673 = !MDLocation(line: 101, column: 3, scope: !156)
!674 = !MDLocation(line: 102, column: 3, scope: !156)
!675 = !{!"0x100\00i\00106\000", !676, !159, !8}  ; [ DW_TAG_auto_variable ] [i] [line 106]
!676 = !{!"0xb\00106\003\006", !1, !156}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!677 = !MDLocation(line: 106, column: 11, scope: !676)
!678 = !MDLocation(line: 106, column: 7, scope: !676)
!679 = !MDLocation(line: 106, column: 18, scope: !680)
!680 = !{!"0xb\002", !1, !681}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!681 = !{!"0xb\001", !1, !682}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!682 = !{!"0xb\00106\003\007", !1, !676}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!683 = !MDLocation(line: 106, column: 3, scope: !676)
!684 = !{!"0x100\00byte\00108\000", !685, !159, !686} ; [ DW_TAG_auto_variable ] [byte] [line 108]
!685 = !{!"0xb\00107\003\008", !1, !682}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!686 = !{!"0x16\00uint8_t\0048\000\000\000\000", !102, null, !687} ; [ DW_TAG_typedef ] [uint8_t] [line 48, size 0, align 0, offset 0] [from unsigned char]
!687 = !{!"0x24\00unsigned char\000\008\008\000\000\008", null, null} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!688 = !MDLocation(line: 108, column: 12, scope: !685)
!689 = !MDLocation(line: 110, column: 26, scope: !690)
!690 = !{!"0xb\00110\007\009", !1, !685}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!691 = !MDLocation(line: 110, column: 7, scope: !690)
!692 = !MDLocation(line: 110, column: 7, scope: !685)
!693 = !MDLocation(line: 111, column: 5, scope: !690)
!694 = !MDLocation(line: 113, column: 16, scope: !685)
!695 = !MDLocation(line: 113, column: 25, scope: !685)
!696 = !MDLocation(line: 113, column: 4, scope: !685)
!697 = !MDLocation(line: 114, column: 3, scope: !685)
!698 = !MDLocation(line: 106, column: 25, scope: !682)
!699 = !MDLocation(line: 106, column: 3, scope: !682)
!700 = !MDLocation(line: 116, column: 11, scope: !701)
!701 = !{!"0xb\00116\003\0010", !1, !156}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!702 = !{!"0x100\00i\00116\000", !701, !159, !8}  ; [ DW_TAG_auto_variable ] [i] [line 116]
!703 = !MDLocation(line: 116, column: 7, scope: !701)
!704 = !MDLocation(line: 116, column: 18, scope: !705)
!705 = !{!"0xb\002", !1, !706}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!706 = !{!"0xb\001", !1, !707}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!707 = !{!"0xb\00116\003\0011", !1, !701}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!708 = !MDLocation(line: 116, column: 3, scope: !701)
!709 = !{!"0x100\00byte\00118\000", !710, !159, !686} ; [ DW_TAG_auto_variable ] [byte] [line 118]
!710 = !{!"0xb\00117\003\0012", !1, !707}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!711 = !MDLocation(line: 118, column: 12, scope: !710)
!712 = !MDLocation(line: 120, column: 26, scope: !713)
!713 = !{!"0xb\00120\007\0013", !1, !710}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!714 = !MDLocation(line: 120, column: 7, scope: !713)
!715 = !MDLocation(line: 120, column: 7, scope: !710)
!716 = !MDLocation(line: 121, column: 5, scope: !713)
!717 = !MDLocation(line: 123, column: 17, scope: !710)
!718 = !MDLocation(line: 123, column: 26, scope: !710)
!719 = !MDLocation(line: 123, column: 4, scope: !710)
!720 = !MDLocation(line: 124, column: 3, scope: !710)
!721 = !MDLocation(line: 116, column: 25, scope: !707)
!722 = !MDLocation(line: 116, column: 3, scope: !707)
!723 = !MDLocation(line: 126, column: 3, scope: !156)
!724 = !MDLocation(line: 127, column: 1, scope: !156)
!725 = !{!"0x101\00this\0016777216\001088", !157, null, !533} ; [ DW_TAG_arg_variable ] [this] [line 0]
!726 = !MDLocation(line: 0, scope: !157)
!727 = !{!"0x101\00file\0033554561\000", !157, !159, !136} ; [ DW_TAG_arg_variable ] [file] [line 129]
!728 = !MDLocation(line: 129, column: 35, scope: !157)
!729 = !{!"0x100\00i\00132\000", !730, !159, !8}  ; [ DW_TAG_auto_variable ] [i] [line 132]
!730 = !{!"0xb\00132\002\0014", !1, !157}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!731 = !MDLocation(line: 132, column: 10, scope: !730)
!732 = !MDLocation(line: 132, column: 6, scope: !730)
!733 = !MDLocation(line: 132, column: 17, scope: !734)
!734 = !{!"0xb\002", !1, !735}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!735 = !{!"0xb\001", !1, !736}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!736 = !{!"0xb\00132\002\0015", !1, !730}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!737 = !MDLocation(line: 132, column: 2, scope: !730)
!738 = !{!"0x100\00byte\00134\000", !739, !159, !686} ; [ DW_TAG_auto_variable ] [byte] [line 134]
!739 = !{!"0xb\00133\002\0016", !1, !736}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!740 = !MDLocation(line: 134, column: 11, scope: !739)
!741 = !MDLocation(line: 136, column: 11, scope: !739)
!742 = !MDLocation(line: 136, column: 23, scope: !739)
!743 = !MDLocation(line: 136, column: 10, scope: !739)
!744 = !MDLocation(line: 136, column: 3, scope: !739)
!745 = !MDLocation(line: 138, column: 26, scope: !746)
!746 = !{!"0xb\00138\006\0017", !1, !739}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!747 = !MDLocation(line: 138, column: 6, scope: !746)
!748 = !MDLocation(line: 138, column: 6, scope: !739)
!749 = !MDLocation(line: 139, column: 4, scope: !746)
!750 = !MDLocation(line: 141, column: 2, scope: !739)
!751 = !MDLocation(line: 132, column: 24, scope: !736)
!752 = !MDLocation(line: 132, column: 2, scope: !736)
!753 = !MDLocation(line: 143, column: 10, scope: !754)
!754 = !{!"0xb\00143\002\0018", !1, !157}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!755 = !{!"0x100\00i\00143\000", !754, !159, !8}  ; [ DW_TAG_auto_variable ] [i] [line 143]
!756 = !MDLocation(line: 143, column: 6, scope: !754)
!757 = !MDLocation(line: 143, column: 17, scope: !758)
!758 = !{!"0xb\002", !1, !759}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!759 = !{!"0xb\001", !1, !760}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!760 = !{!"0xb\00143\002\0019", !1, !754}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!761 = !MDLocation(line: 143, column: 2, scope: !754)
!762 = !{!"0x100\00byte\00145\000", !763, !159, !686} ; [ DW_TAG_auto_variable ] [byte] [line 145]
!763 = !{!"0xb\00144\002\0020", !1, !760}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!764 = !MDLocation(line: 145, column: 11, scope: !763)
!765 = !MDLocation(line: 147, column: 11, scope: !763)
!766 = !MDLocation(line: 147, column: 24, scope: !763)
!767 = !MDLocation(line: 147, column: 10, scope: !763)
!768 = !MDLocation(line: 147, column: 3, scope: !763)
!769 = !MDLocation(line: 149, column: 26, scope: !770)
!770 = !{!"0xb\00149\006\0021", !1, !763}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!771 = !MDLocation(line: 149, column: 6, scope: !770)
!772 = !MDLocation(line: 149, column: 6, scope: !763)
!773 = !MDLocation(line: 150, column: 4, scope: !770)
!774 = !MDLocation(line: 152, column: 2, scope: !763)
!775 = !MDLocation(line: 143, column: 24, scope: !760)
!776 = !MDLocation(line: 143, column: 2, scope: !760)
!777 = !MDLocation(line: 154, column: 2, scope: !157)
!778 = !MDLocation(line: 155, column: 1, scope: !157)
!779 = !{!"0x101\00x\0016777376\000", !158, !159, !8} ; [ DW_TAG_arg_variable ] [x] [line 160]
!780 = !MDLocation(line: 160, column: 16, scope: !158)
!781 = !{!"0x101\00y\0033554592\000", !158, !159, !8} ; [ DW_TAG_arg_variable ] [y] [line 160]
!782 = !MDLocation(line: 160, column: 23, scope: !158)
!783 = !{!"0x100\00no\00162\000", !158, !159, !8} ; [ DW_TAG_auto_variable ] [no] [line 162]
!784 = !MDLocation(line: 162, column: 6, scope: !158)
!785 = !MDLocation(line: 164, column: 5, scope: !786)
!786 = !{!"0xb\00164\005\0022", !1, !158}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!787 = !MDLocation(line: 164, column: 5, scope: !158)
!788 = !MDLocation(line: 164, column: 14, scope: !789)
!789 = !{!"0xb\001", !1, !786}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!790 = !MDLocation(line: 164, column: 24, scope: !791)
!791 = !{!"0xb\002", !1, !786}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!792 = !MDLocation(line: 164, column: 33, scope: !793)
!793 = !{!"0xb\003", !1, !786}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!794 = !MDLocation(line: 166, column: 6, scope: !795)
!795 = !{!"0xb\00166\006\0024", !1, !796}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!796 = !{!"0xb\00165\002\0023", !1, !786}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!797 = !MDLocation(line: 166, column: 6, scope: !796)
!798 = !MDLocation(line: 167, column: 7, scope: !799)
!799 = !{!"0xb\00167\007\0025", !1, !795}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!800 = !MDLocation(line: 167, column: 21, scope: !799)
!801 = !MDLocation(line: 167, column: 17, scope: !799)
!802 = !MDLocation(line: 167, column: 12, scope: !799)
!803 = !MDLocation(line: 167, column: 7, scope: !795)
!804 = !MDLocation(line: 168, column: 5, scope: !799)
!805 = !MDLocation(line: 167, column: 23, scope: !806)
!806 = !{!"0xb\001", !1, !799}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!807 = !MDLocation(line: 170, column: 6, scope: !808)
!808 = !{!"0xb\00170\006\0026", !1, !796}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!809 = !MDLocation(line: 170, column: 6, scope: !796)
!810 = !MDLocation(line: 171, column: 7, scope: !811)
!811 = !{!"0xb\00171\007\0027", !1, !808}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!812 = !MDLocation(line: 171, column: 13, scope: !811)
!813 = !MDLocation(line: 171, column: 7, scope: !808)
!814 = !MDLocation(line: 172, column: 5, scope: !811)
!815 = !MDLocation(line: 171, column: 18, scope: !816)
!816 = !{!"0xb\001", !1, !811}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!817 = !MDLocation(line: 174, column: 8, scope: !796)
!818 = !MDLocation(line: 174, column: 10, scope: !796)
!819 = !MDLocation(line: 174, column: 3, scope: !796)
!820 = !MDLocation(line: 176, column: 6, scope: !821)
!821 = !{!"0xb\00176\006\0028", !1, !796}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!822 = !MDLocation(line: 176, column: 6, scope: !796)
!823 = !MDLocation(line: 176, column: 13, scope: !824)
!824 = !{!"0xb\001", !1, !821}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!825 = !MDLocation(line: 177, column: 6, scope: !826)
!826 = !{!"0xb\00177\006\0029", !1, !796}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!827 = !MDLocation(line: 177, column: 6, scope: !796)
!828 = !MDLocation(line: 177, column: 13, scope: !829)
!829 = !{!"0xb\001", !1, !826}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!830 = !MDLocation(line: 178, column: 6, scope: !831)
!831 = !{!"0xb\00178\006\0030", !1, !796}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!832 = !MDLocation(line: 178, column: 6, scope: !796)
!833 = !MDLocation(line: 178, column: 13, scope: !834)
!834 = !{!"0xb\001", !1, !831}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!835 = !MDLocation(line: 179, column: 6, scope: !836)
!836 = !{!"0xb\00179\006\0031", !1, !796}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!837 = !MDLocation(line: 179, column: 6, scope: !796)
!838 = !MDLocation(line: 179, column: 13, scope: !839)
!839 = !{!"0xb\001", !1, !836}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!840 = !MDLocation(line: 180, column: 6, scope: !841)
!841 = !{!"0xb\00180\006\0032", !1, !796}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!842 = !MDLocation(line: 180, column: 6, scope: !796)
!843 = !MDLocation(line: 180, column: 13, scope: !844)
!844 = !{!"0xb\001", !1, !841}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!845 = !MDLocation(line: 181, column: 6, scope: !846)
!846 = !{!"0xb\00181\006\0033", !1, !796}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!847 = !MDLocation(line: 181, column: 6, scope: !796)
!848 = !MDLocation(line: 181, column: 13, scope: !849)
!849 = !{!"0xb\001", !1, !846}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!850 = !MDLocation(line: 182, column: 6, scope: !851)
!851 = !{!"0xb\00182\006\0034", !1, !796}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!852 = !MDLocation(line: 182, column: 6, scope: !796)
!853 = !MDLocation(line: 182, column: 13, scope: !854)
!854 = !{!"0xb\001", !1, !851}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!855 = !MDLocation(line: 183, column: 6, scope: !856)
!856 = !{!"0xb\00183\006\0035", !1, !796}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!857 = !MDLocation(line: 183, column: 6, scope: !796)
!858 = !MDLocation(line: 183, column: 13, scope: !859)
!859 = !{!"0xb\001", !1, !856}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!860 = !MDLocation(line: 185, column: 10, scope: !796)
!861 = !MDLocation(line: 185, column: 3, scope: !796)
!862 = !MDLocation(line: 188, column: 2, scope: !158)
!863 = !MDLocation(line: 189, column: 1, scope: !158)
!864 = !{!"0x101\00this\0016777216\001088", !162, null, !533} ; [ DW_TAG_arg_variable ] [this] [line 0]
!865 = !MDLocation(line: 0, scope: !162)
!866 = !{!"0x100\00x\00193\000", !162, !159, !8}  ; [ DW_TAG_auto_variable ] [x] [line 193]
!867 = !MDLocation(line: 193, column: 6, scope: !162)
!868 = !{!"0x100\00y\00193\000", !162, !159, !8}  ; [ DW_TAG_auto_variable ] [y] [line 193]
!869 = !MDLocation(line: 193, column: 9, scope: !162)
!870 = !{!"0x100\00no\00193\000", !162, !159, !8} ; [ DW_TAG_auto_variable ] [no] [line 193]
!871 = !MDLocation(line: 193, column: 12, scope: !162)
!872 = !{!"0x100\00off\00193\000", !162, !159, !8} ; [ DW_TAG_auto_variable ] [off] [line 193]
!873 = !MDLocation(line: 193, column: 16, scope: !162)
!874 = !MDLocation(line: 195, column: 6, scope: !875)
!875 = !{!"0xb\00195\002\0036", !1, !162}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!876 = !MDLocation(line: 195, column: 13, scope: !877)
!877 = !{!"0xb\002", !1, !878}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!878 = !{!"0xb\001", !1, !879}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!879 = !{!"0xb\00195\002\0037", !1, !875}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!880 = !MDLocation(line: 195, column: 2, scope: !875)
!881 = !MDLocation(line: 197, column: 6, scope: !882)
!882 = !{!"0xb\00197\006\0039", !1, !883}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!883 = !{!"0xb\00196\002\0038", !1, !879}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!884 = !MDLocation(line: 197, column: 6, scope: !883)
!885 = !MDLocation(line: 199, column: 8, scope: !886)
!886 = !{!"0xb\00199\004\0041", !1, !887}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!887 = !{!"0xb\00198\003\0040", !1, !882}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!888 = !MDLocation(line: 199, column: 17, scope: !889)
!889 = !{!"0xb\002", !1, !890}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!890 = !{!"0xb\001", !1, !891}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!891 = !{!"0xb\00199\004\0042", !1, !886}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!892 = !MDLocation(line: 199, column: 28, scope: !891)
!893 = !MDLocation(line: 199, column: 24, scope: !891)
!894 = !MDLocation(line: 199, column: 17, scope: !891)
!895 = !MDLocation(line: 199, column: 4, scope: !886)
!896 = !MDLocation(line: 200, column: 10, scope: !891)
!897 = !MDLocation(line: 200, column: 5, scope: !891)
!898 = !MDLocation(line: 199, column: 32, scope: !891)
!899 = !MDLocation(line: 199, column: 4, scope: !891)
!900 = !MDLocation(line: 201, column: 3, scope: !887)
!901 = !MDLocation(line: 202, column: 7, scope: !902)
!902 = !{!"0xb\00202\003\0043", !1, !883}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!903 = !MDLocation(line: 202, column: 14, scope: !904)
!904 = !{!"0xb\002", !1, !905}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!905 = !{!"0xb\001", !1, !906}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!906 = !{!"0xb\00202\003\0044", !1, !902}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!907 = !MDLocation(line: 202, column: 3, scope: !902)
!908 = !MDLocation(line: 204, column: 20, scope: !909)
!909 = !{!"0xb\00204\007\0046", !1, !910}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!910 = !{!"0xb\00203\003\0045", !1, !906}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!911 = !MDLocation(line: 204, column: 23, scope: !909)
!912 = !MDLocation(line: 204, column: 13, scope: !909)
!913 = !MDLocation(line: 204, column: 8, scope: !909)
!914 = !MDLocation(line: 204, column: 7, scope: !909)
!915 = !MDLocation(line: 204, column: 7, scope: !910)
!916 = !MDLocation(line: 205, column: 10, scope: !909)
!917 = !MDLocation(line: 205, column: 5, scope: !909)
!918 = !MDLocation(line: 208, column: 15, scope: !919)
!919 = !{!"0xb\00208\008\0048", !1, !920}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!920 = !{!"0xb\00207\004\0047", !1, !909}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/bitboard64.cpp]
!921 = !MDLocation(line: 208, column: 8, scope: !919)
!922 = !MDLocation(line: 208, column: 8, scope: !920)
!923 = !MDLocation(line: 209, column: 11, scope: !919)
!924 = !MDLocation(line: 209, column: 6, scope: !919)
!925 = !MDLocation(line: 211, column: 11, scope: !919)
!926 = !MDLocation(line: 213, column: 3, scope: !910)
!927 = !MDLocation(line: 202, column: 22, scope: !906)
!928 = !MDLocation(line: 202, column: 3, scope: !906)
!929 = !MDLocation(line: 214, column: 8, scope: !883)
!930 = !MDLocation(line: 215, column: 2, scope: !883)
!931 = !MDLocation(line: 195, column: 21, scope: !879)
!932 = !MDLocation(line: 195, column: 2, scope: !879)
!933 = !MDLocation(line: 216, column: 1, scope: !162)
!934 = !MDLocation(line: 0, scope: !164)
