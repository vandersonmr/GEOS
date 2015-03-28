; ModuleID = 'hexxagongame.cpp'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%class.BitBoard64 = type { i32, i32 }
%class.HexxagonGame = type { i32, %class.GameList*, %class.GameList* }
%class.GameList = type { %class.HexxagonBoard, %class.GameList*, %class.GameList* }
%class.HexxagonBoard = type { %class.BitBoard64, %class.BitBoard64 }
%class.HexxagonMove = type opaque
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@clone_lookups = external global %class.BitBoard64*
@jump_lookups = external global %class.BitBoard64*
@.str = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str1 = private unnamed_addr constant [14 x i8] c"Hex2agon 1.1\0A\00", align 1
@.str2 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@__llvm_gcov_ctr = internal global [11 x i64] zeroinitializer
@__llvm_gcda_edge_table = internal unnamed_addr constant [2 x i64*] [i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr, i64 0, i64 7), i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr, i64 0, i64 8)]
@__llvm_gcov_global_state_pred = internal unnamed_addr global i32 -1
@__llvm_gcov_ctr3 = internal global [6 x i64] zeroinitializer
@__llvm_gcov_ctr4 = internal global [6 x i64] zeroinitializer
@__llvm_gcov_ctr5 = internal global [6 x i64] zeroinitializer
@__llvm_gcov_ctr6 = internal global [9 x i64] zeroinitializer
@__llvm_gcov_ctr7 = internal global [12 x i64] zeroinitializer
@__llvm_gcda_edge_table8 = internal unnamed_addr constant [2 x i64*] [i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr7, i64 0, i64 1), i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr7, i64 0, i64 2)]
@__llvm_gcov_global_state_pred9 = internal unnamed_addr global i32 -1
@__llvm_gcov_ctr10 = internal global [12 x i64] zeroinitializer
@__llvm_gcda_edge_table11 = internal unnamed_addr constant [2 x i64*] [i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr10, i64 0, i64 1), i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr10, i64 0, i64 2)]
@__llvm_gcov_global_state_pred12 = internal unnamed_addr global i32 -1
@__llvm_gcov_ctr13 = internal global [6 x i64] zeroinitializer
@__llvm_gcov_ctr14 = internal global [35 x i64] zeroinitializer
@__llvm_gcda_edge_table15 = internal unnamed_addr constant [8 x i64*] [i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 21), i64* null, i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 22), i64* null, i64* null, i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 25), i64* null, i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 26)]
@__llvm_gcov_global_state_pred16 = internal unnamed_addr global i32 -1
@__llvm_gcov_ctr17 = internal global [19 x i64] zeroinitializer
@__llvm_gcov_ctr18 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr19 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr20 = internal global [2 x i64] zeroinitializer
@0 = private unnamed_addr constant [5 x i8] c"*204\00"
@1 = private unnamed_addr constant [94 x i8] c"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.gcda\00"
@2 = private unnamed_addr constant [22 x i8] c"_ZN12HexxagonGameC2Ev\00"
@3 = private unnamed_addr constant [25 x i8] c"_ZN12HexxagonGame4nextEv\00"
@4 = private unnamed_addr constant [25 x i8] c"_ZN12HexxagonGame4prevEv\00"
@5 = private unnamed_addr constant [26 x i8] c"_ZN12HexxagonGame5resetEv\00"
@6 = private unnamed_addr constant [33 x i8] c"_ZN12HexxagonGame11destroyRestEv\00"
@7 = private unnamed_addr constant [44 x i8] c"_ZN12HexxagonGame9applyMoveER12HexxagonMove\00"
@8 = private unnamed_addr constant [40 x i8] c"_ZN12HexxagonGame12computerMoveEiPFvvEi\00"
@9 = private unnamed_addr constant [29 x i8] c"_ZN12HexxagonGame8noBoardsEv\00"
@10 = private unnamed_addr constant [30 x i8] c"_ZN12HexxagonGame8loadGameEPc\00"
@11 = private unnamed_addr constant [30 x i8] c"_ZN12HexxagonGame8saveGameEPc\00"
@12 = private unnamed_addr constant [19 x i8] c"_ZN8GameListC2EPS_\00"
@13 = private unnamed_addr constant [23 x i8] c"_ZN13HexxagonBoardC2Ev\00"
@14 = private unnamed_addr constant [20 x i8] c"_ZN10BitBoard64C2Ev\00"
@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 0, void ()* @__llvm_gcov_init }]

@_ZN12HexxagonGameC1Ev = alias void (%class.HexxagonGame*)* @_ZN12HexxagonGameC2Ev

; Function Attrs: uwtable
define void @_ZN12HexxagonGameC2Ev(%class.HexxagonGame* %this) unnamed_addr #0 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonGame*, align 8
  %tmp = alloca %class.GameList*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.HexxagonGame* %this, %class.HexxagonGame** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonGame** %this.addr, metadata !223, metadata !225), !dbg !226
  %this1 = load %class.HexxagonGame** %this.addr
  %3 = load %class.BitBoard64** @clone_lookups, align 8, !dbg !227
  %tobool = icmp ne %class.BitBoard64* %3, null, !dbg !227
  %4 = select i1 %tobool, i64 1, i64 2, !dbg !230
  %5 = getelementptr inbounds [11 x i64]* @__llvm_gcov_ctr, i64 0, i64 %4, !dbg !230
  %6 = load i64* %5, !dbg !230
  %7 = add i64 %6, 1, !dbg !230
  store i64 %7, i64* %5, !dbg !230
  br i1 %tobool, label %if.end, label %if.then, !dbg !230

if.then:                                          ; preds = %2
  %8 = load i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr, i64 0, i64 3), !dbg !231
  %9 = add i64 %8, 1, !dbg !231
  store i64 %9, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr, i64 0, i64 3), !dbg !231
  call void @_Z16initCloneLookupsv(), !dbg !231
  br label %if.end, !dbg !231

if.end:                                           ; preds = %if.then, %2
  %10 = load %class.BitBoard64** @jump_lookups, align 8, !dbg !232
  %tobool2 = icmp ne %class.BitBoard64* %10, null, !dbg !232
  %11 = select i1 %tobool2, i64 4, i64 5, !dbg !234
  %12 = getelementptr inbounds [11 x i64]* @__llvm_gcov_ctr, i64 0, i64 %11, !dbg !234
  %13 = load i64* %12, !dbg !234
  %14 = add i64 %13, 1, !dbg !234
  store i64 %14, i64* %12, !dbg !234
  br i1 %tobool2, label %if.end4, label %if.then3, !dbg !234

if.then3:                                         ; preds = %if.end
  %15 = load i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr, i64 0, i64 6), !dbg !235
  %16 = add i64 %15, 1, !dbg !235
  store i64 %16, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr, i64 0, i64 6), !dbg !235
  call void @_Z15initJumpLookupsv(), !dbg !235
  br label %if.end4, !dbg !235

if.end4:                                          ; preds = %if.then3, %if.end
  store i32 0, i32* @__llvm_gcov_global_state_pred, !dbg !236
  call void @llvm.dbg.declare(metadata %class.GameList** %tmp, metadata !237, metadata !225), !dbg !236
  %call = call noalias i8* @_Znwm(i64 32) #9, !dbg !239
  %17 = bitcast i8* %call to %class.GameList*, !dbg !239
  invoke void @_ZN8GameListC2EPS_(%class.GameList* %17, %class.GameList* null)
          to label %invoke.cont unwind label %lpad, !dbg !239

invoke.cont:                                      ; preds = %if.end4
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred, i64** getelementptr inbounds ([2 x i64*]* @__llvm_gcda_edge_table, i64 0, i64 0)), !dbg !240
  %18 = load i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr, i64 0, i64 9), !dbg !240
  %19 = add i64 %18, 1, !dbg !240
  store i64 %19, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr, i64 0, i64 9), !dbg !240
  store %class.GameList* %17, %class.GameList** %tmp, align 8, !dbg !240
  %20 = load %class.GameList** %tmp, align 8, !dbg !242
  %21 = bitcast %class.GameList* %20 to %class.HexxagonBoard*, !dbg !242
  call void @_ZN13HexxagonBoard4initEv(%class.HexxagonBoard* %21), !dbg !242
  %22 = load %class.GameList** %tmp, align 8, !dbg !243
  %first = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 1, !dbg !244
  store %class.GameList* %22, %class.GameList** %first, align 8, !dbg !244
  %23 = load %class.GameList** %tmp, align 8, !dbg !245
  %curr = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !246
  store %class.GameList* %23, %class.GameList** %curr, align 8, !dbg !246
  %turn = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 0, !dbg !247
  store i32 1, i32* %turn, align 4, !dbg !247
  ret void, !dbg !248

lpad:                                             ; preds = %if.end4
  %24 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !249
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred, i64** getelementptr inbounds ([2 x i64*]* @__llvm_gcda_edge_table, i64 0, i64 1)), !dbg !249
  %25 = load i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr, i64 0, i64 10), !dbg !249
  %26 = add i64 %25, 1, !dbg !249
  store i64 %26, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr, i64 0, i64 10), !dbg !249
  %27 = extractvalue { i8*, i32 } %24, 0, !dbg !249
  store i8* %27, i8** %exn.slot, !dbg !249
  %28 = extractvalue { i8*, i32 } %24, 1, !dbg !249
  store i32 %28, i32* %ehselector.slot, !dbg !249
  call void @_ZdlPv(i8* %call) #10, !dbg !249
  br label %eh.resume, !dbg !249

eh.resume:                                        ; preds = %lpad
  %exn = load i8** %exn.slot, !dbg !250
  %sel = load i32* %ehselector.slot, !dbg !250
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !250
  %lpad.val5 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !250
  resume { i8*, i32 } %lpad.val5, !dbg !250
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @_Z16initCloneLookupsv() #2

declare void @_Z15initJumpLookupsv() #2

; Function Attrs: nobuiltin
declare noalias i8* @_Znwm(i64) #3

; Function Attrs: uwtable
define linkonce_odr void @_ZN8GameListC2EPS_(%class.GameList* %this, %class.GameList* %p) unnamed_addr #0 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr18, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr18, i64 0, i64 0)
  %this.addr = alloca %class.GameList*, align 8
  %p.addr = alloca %class.GameList*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr18, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr18, i64 0, i64 1)
  store %class.GameList* %this, %class.GameList** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.GameList** %this.addr, metadata !251, metadata !225), !dbg !252
  store %class.GameList* %p, %class.GameList** %p.addr, align 8
  call void @llvm.dbg.declare(metadata %class.GameList** %p.addr, metadata !253, metadata !225), !dbg !255
  %this1 = load %class.GameList** %this.addr
  %5 = bitcast %class.GameList* %this1 to %class.HexxagonBoard*, !dbg !256
  call void @_ZN13HexxagonBoardC2Ev(%class.HexxagonBoard* %5), !dbg !256
  %6 = load %class.GameList** %p.addr, align 8, !dbg !257
  %prev = getelementptr inbounds %class.GameList* %this1, i32 0, i32 2, !dbg !259
  store %class.GameList* %6, %class.GameList** %prev, align 8, !dbg !259
  %next = getelementptr inbounds %class.GameList* %this1, i32 0, i32 1, !dbg !260
  store %class.GameList* null, %class.GameList** %next, align 8, !dbg !260
  ret void, !dbg !261
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #4

declare void @_ZN13HexxagonBoard4initEv(%class.HexxagonBoard*) #2

; Function Attrs: nounwind uwtable
define i32 @_ZN12HexxagonGame4nextEv(%class.HexxagonGame* %this) #5 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr3, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr3, i64 0, i64 0)
  %retval = alloca i32, align 4
  %this.addr = alloca %class.HexxagonGame*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.HexxagonGame* %this, %class.HexxagonGame** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonGame** %this.addr, metadata !262, metadata !225), !dbg !263
  %this1 = load %class.HexxagonGame** %this.addr
  %curr = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !264
  %3 = load %class.GameList** %curr, align 8, !dbg !264
  %next = getelementptr inbounds %class.GameList* %3, i32 0, i32 1, !dbg !264
  %4 = load %class.GameList** %next, align 8, !dbg !264
  %tobool = icmp ne %class.GameList* %4, null, !dbg !264
  %5 = select i1 %tobool, i64 1, i64 2, !dbg !266
  %6 = getelementptr inbounds [6 x i64]* @__llvm_gcov_ctr3, i64 0, i64 %5, !dbg !266
  %7 = load i64* %6, !dbg !266
  %8 = add i64 %7, 1, !dbg !266
  store i64 %8, i64* %6, !dbg !266
  br i1 %tobool, label %if.then, label %if.end, !dbg !266

if.then:                                          ; preds = %2
  %9 = load i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr3, i64 0, i64 3), !dbg !267
  %10 = add i64 %9, 1, !dbg !267
  store i64 %10, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr3, i64 0, i64 3), !dbg !267
  %turn = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 0, !dbg !267
  %11 = load i32* %turn, align 4, !dbg !267
  %tobool2 = icmp ne i32 %11, 0, !dbg !267
  %lnot = xor i1 %tobool2, true, !dbg !269
  %conv = zext i1 %lnot to i32, !dbg !269
  %turn3 = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 0, !dbg !270
  store i32 %conv, i32* %turn3, align 4, !dbg !270
  %curr4 = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !271
  %12 = load %class.GameList** %curr4, align 8, !dbg !271
  %next5 = getelementptr inbounds %class.GameList* %12, i32 0, i32 1, !dbg !271
  %13 = load %class.GameList** %next5, align 8, !dbg !271
  %curr6 = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !272
  store %class.GameList* %13, %class.GameList** %curr6, align 8, !dbg !272
  store i32 0, i32* %retval, !dbg !273
  br label %return, !dbg !273

if.end:                                           ; preds = %2
  %14 = load i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr3, i64 0, i64 4), !dbg !274
  %15 = add i64 %14, 1, !dbg !274
  store i64 %15, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr3, i64 0, i64 4), !dbg !274
  store i32 -1, i32* %retval, !dbg !274
  br label %return, !dbg !274

return:                                           ; preds = %if.end, %if.then
  %16 = load i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr3, i64 0, i64 5), !dbg !275
  %17 = add i64 %16, 1, !dbg !275
  store i64 %17, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr3, i64 0, i64 5), !dbg !275
  %18 = load i32* %retval, !dbg !275
  ret i32 %18, !dbg !275
}

; Function Attrs: nounwind uwtable
define i32 @_ZN12HexxagonGame4prevEv(%class.HexxagonGame* %this) #5 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr4, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr4, i64 0, i64 0)
  %retval = alloca i32, align 4
  %this.addr = alloca %class.HexxagonGame*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.HexxagonGame* %this, %class.HexxagonGame** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonGame** %this.addr, metadata !276, metadata !225), !dbg !277
  %this1 = load %class.HexxagonGame** %this.addr
  %curr = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !278
  %3 = load %class.GameList** %curr, align 8, !dbg !278
  %prev = getelementptr inbounds %class.GameList* %3, i32 0, i32 2, !dbg !278
  %4 = load %class.GameList** %prev, align 8, !dbg !278
  %tobool = icmp ne %class.GameList* %4, null, !dbg !278
  %5 = select i1 %tobool, i64 1, i64 2, !dbg !280
  %6 = getelementptr inbounds [6 x i64]* @__llvm_gcov_ctr4, i64 0, i64 %5, !dbg !280
  %7 = load i64* %6, !dbg !280
  %8 = add i64 %7, 1, !dbg !280
  store i64 %8, i64* %6, !dbg !280
  br i1 %tobool, label %if.then, label %if.end, !dbg !280

if.then:                                          ; preds = %2
  %9 = load i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr4, i64 0, i64 3), !dbg !281
  %10 = add i64 %9, 1, !dbg !281
  store i64 %10, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr4, i64 0, i64 3), !dbg !281
  %turn = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 0, !dbg !281
  %11 = load i32* %turn, align 4, !dbg !281
  %tobool2 = icmp ne i32 %11, 0, !dbg !281
  %lnot = xor i1 %tobool2, true, !dbg !283
  %conv = zext i1 %lnot to i32, !dbg !283
  %turn3 = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 0, !dbg !284
  store i32 %conv, i32* %turn3, align 4, !dbg !284
  %curr4 = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !285
  %12 = load %class.GameList** %curr4, align 8, !dbg !285
  %prev5 = getelementptr inbounds %class.GameList* %12, i32 0, i32 2, !dbg !285
  %13 = load %class.GameList** %prev5, align 8, !dbg !285
  %curr6 = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !286
  store %class.GameList* %13, %class.GameList** %curr6, align 8, !dbg !286
  store i32 0, i32* %retval, !dbg !287
  br label %return, !dbg !287

if.end:                                           ; preds = %2
  %14 = load i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr4, i64 0, i64 4), !dbg !288
  %15 = add i64 %14, 1, !dbg !288
  store i64 %15, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr4, i64 0, i64 4), !dbg !288
  store i32 -1, i32* %retval, !dbg !288
  br label %return, !dbg !288

return:                                           ; preds = %if.end, %if.then
  %16 = load i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr4, i64 0, i64 5), !dbg !289
  %17 = add i64 %16, 1, !dbg !289
  store i64 %17, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr4, i64 0, i64 5), !dbg !289
  %18 = load i32* %retval, !dbg !289
  ret i32 %18, !dbg !289
}

; Function Attrs: uwtable
define void @_ZN12HexxagonGame5resetEv(%class.HexxagonGame* %this) #0 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr5, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr5, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonGame*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr5, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr5, i64 0, i64 1)
  store %class.HexxagonGame* %this, %class.HexxagonGame** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonGame** %this.addr, metadata !290, metadata !225), !dbg !291
  %this1 = load %class.HexxagonGame** %this.addr
  br label %while.cond, !dbg !292

while.cond:                                       ; preds = %while.body, %2
  %call = call i32 @_ZN12HexxagonGame4prevEv(%class.HexxagonGame* %this1), !dbg !293
  %tobool = icmp ne i32 %call, 0, !dbg !293
  %lnot = xor i1 %tobool, true, !dbg !296
  %5 = select i1 %lnot, i64 2, i64 3, !dbg !292
  %6 = getelementptr inbounds [6 x i64]* @__llvm_gcov_ctr5, i64 0, i64 %5, !dbg !292
  %7 = load i64* %6, !dbg !292
  %8 = add i64 %7, 1, !dbg !292
  store i64 %8, i64* %6, !dbg !292
  br i1 %lnot, label %while.body, label %while.end, !dbg !292

while.body:                                       ; preds = %while.cond
  %9 = load i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr5, i64 0, i64 4), !dbg !297
  %10 = add i64 %9, 1, !dbg !297
  store i64 %10, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr5, i64 0, i64 4), !dbg !297
  br label %while.cond, !dbg !297

while.end:                                        ; preds = %while.cond
  %11 = load i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr5, i64 0, i64 5), !dbg !299
  %12 = add i64 %11, 1, !dbg !299
  store i64 %12, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr5, i64 0, i64 5), !dbg !299
  call void @_ZN12HexxagonGame11destroyRestEv(%class.HexxagonGame* %this1), !dbg !299
  ret void, !dbg !300
}

; Function Attrs: nounwind uwtable
define void @_ZN12HexxagonGame11destroyRestEv(%class.HexxagonGame* %this) #5 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr6, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr6, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonGame*, align 8
  %step = alloca %class.GameList*, align 8
  %tmp = alloca %class.GameList*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr6, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr6, i64 0, i64 1)
  store %class.HexxagonGame* %this, %class.HexxagonGame** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonGame** %this.addr, metadata !301, metadata !225), !dbg !302
  %this1 = load %class.HexxagonGame** %this.addr
  call void @llvm.dbg.declare(metadata %class.GameList** %step, metadata !303, metadata !225), !dbg !304
  %curr = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !305
  %5 = load %class.GameList** %curr, align 8, !dbg !305
  %next = getelementptr inbounds %class.GameList* %5, i32 0, i32 1, !dbg !305
  %6 = load %class.GameList** %next, align 8, !dbg !305
  store %class.GameList* %6, %class.GameList** %step, align 8, !dbg !304
  br label %while.cond, !dbg !306

while.cond:                                       ; preds = %delete.end, %2
  %7 = load %class.GameList** %step, align 8, !dbg !307
  %tobool = icmp ne %class.GameList* %7, null, !dbg !307
  %8 = select i1 %tobool, i64 2, i64 3, !dbg !306
  %9 = getelementptr inbounds [9 x i64]* @__llvm_gcov_ctr6, i64 0, i64 %8, !dbg !306
  %10 = load i64* %9, !dbg !306
  %11 = add i64 %10, 1, !dbg !306
  store i64 %11, i64* %9, !dbg !306
  br i1 %tobool, label %while.body, label %while.end, !dbg !306

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata %class.GameList** %tmp, metadata !310, metadata !225), !dbg !312
  %12 = load %class.GameList** %step, align 8, !dbg !313
  store %class.GameList* %12, %class.GameList** %tmp, align 8, !dbg !312
  %13 = load %class.GameList** %step, align 8, !dbg !314
  %isnull = icmp eq %class.GameList* %13, null, !dbg !315
  %14 = select i1 %isnull, i64 4, i64 5, !dbg !315
  %15 = getelementptr inbounds [9 x i64]* @__llvm_gcov_ctr6, i64 0, i64 %14, !dbg !315
  %16 = load i64* %15, !dbg !315
  %17 = add i64 %16, 1, !dbg !315
  store i64 %17, i64* %15, !dbg !315
  br i1 %isnull, label %delete.end, label %delete.notnull, !dbg !315

delete.notnull:                                   ; preds = %while.body
  %18 = load i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr6, i64 0, i64 6), !dbg !316
  %19 = add i64 %18, 1, !dbg !316
  store i64 %19, i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr6, i64 0, i64 6), !dbg !316
  %20 = bitcast %class.GameList* %13 to i8*, !dbg !316
  call void @_ZdlPv(i8* %20) #10, !dbg !316
  br label %delete.end, !dbg !316

delete.end:                                       ; preds = %delete.notnull, %while.body
  %21 = load i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr6, i64 0, i64 7), !dbg !318
  %22 = add i64 %21, 1, !dbg !318
  store i64 %22, i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr6, i64 0, i64 7), !dbg !318
  %23 = load %class.GameList** %tmp, align 8, !dbg !318
  %next2 = getelementptr inbounds %class.GameList* %23, i32 0, i32 1, !dbg !318
  %24 = load %class.GameList** %next2, align 8, !dbg !318
  store %class.GameList* %24, %class.GameList** %step, align 8, !dbg !319
  br label %while.cond, !dbg !306

while.end:                                        ; preds = %while.cond
  %25 = load i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr6, i64 0, i64 8), !dbg !320
  %26 = add i64 %25, 1, !dbg !320
  store i64 %26, i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr6, i64 0, i64 8), !dbg !320
  %curr3 = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !320
  %27 = load %class.GameList** %curr3, align 8, !dbg !320
  %next4 = getelementptr inbounds %class.GameList* %27, i32 0, i32 1, !dbg !320
  store %class.GameList* null, %class.GameList** %next4, align 8, !dbg !320
  ret void, !dbg !321
}

; Function Attrs: uwtable
define i32 @_ZN12HexxagonGame9applyMoveER12HexxagonMove(%class.HexxagonGame* %this, %class.HexxagonMove* nonnull %move) #0 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr7, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr7, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonGame*, align 8
  %move.addr = alloca %class.HexxagonMove*, align 8
  %tmp = alloca %class.GameList*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %tmp3 = alloca %class.HexxagonBoard, align 4
  %ret = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  store i32 0, i32* @__llvm_gcov_global_state_pred9
  store %class.HexxagonGame* %this, %class.HexxagonGame** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonGame** %this.addr, metadata !322, metadata !225), !dbg !323
  store %class.HexxagonMove* %move, %class.HexxagonMove** %move.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonMove** %move.addr, metadata !324, metadata !225), !dbg !325
  %this1 = load %class.HexxagonGame** %this.addr
  call void @llvm.dbg.declare(metadata %class.GameList** %tmp, metadata !326, metadata !225), !dbg !327
  %call = call noalias i8* @_Znwm(i64 32) #9, !dbg !328
  %3 = bitcast i8* %call to %class.GameList*, !dbg !328
  %curr = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !329
  %4 = load %class.GameList** %curr, align 8, !dbg !329
  invoke void @_ZN8GameListC2EPS_(%class.GameList* %3, %class.GameList* %4)
          to label %invoke.cont unwind label %lpad, !dbg !328

invoke.cont:                                      ; preds = %2
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred9, i64** getelementptr inbounds ([2 x i64*]* @__llvm_gcda_edge_table8, i64 0, i64 0)), !dbg !330
  store %class.GameList* %3, %class.GameList** %tmp, align 8, !dbg !330
  %5 = load %class.GameList** %tmp, align 8, !dbg !332
  %6 = bitcast %class.GameList* %5 to %class.HexxagonBoard*, !dbg !332
  %curr2 = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !333
  %7 = load %class.GameList** %curr2, align 8, !dbg !333
  %8 = bitcast %class.GameList* %7 to %class.HexxagonBoard*, !dbg !332
  call void @_ZN13HexxagonBoardaSERKS_(%class.HexxagonBoard* sret %tmp3, %class.HexxagonBoard* %6, %class.HexxagonBoard* dereferenceable(16) %8), !dbg !332
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !334, metadata !225), !dbg !335
  %9 = load %class.GameList** %tmp, align 8, !dbg !336
  %10 = bitcast %class.GameList* %9 to %class.HexxagonBoard*, !dbg !336
  %11 = load %class.HexxagonMove** %move.addr, align 8, !dbg !336
  %call5 = call i32 @_ZN13HexxagonBoard9applyMoveER12HexxagonMove(%class.HexxagonBoard* %10, %class.HexxagonMove* nonnull %11), !dbg !336
  store i32 %call5, i32* %ret, align 4, !dbg !335
  %12 = load i32* %ret, align 4, !dbg !337
  %tobool = icmp ne i32 %12, 0, !dbg !337
  %13 = select i1 %tobool, i64 3, i64 4, !dbg !339
  %14 = getelementptr inbounds [12 x i64]* @__llvm_gcov_ctr7, i64 0, i64 %13, !dbg !339
  %15 = load i64* %14, !dbg !339
  %16 = add i64 %15, 1, !dbg !339
  store i64 %16, i64* %14, !dbg !339
  br i1 %tobool, label %if.else, label %if.then, !dbg !339

if.then:                                          ; preds = %invoke.cont
  %17 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr7, i64 0, i64 5), !dbg !340
  %18 = add i64 %17, 1, !dbg !340
  store i64 %18, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr7, i64 0, i64 5), !dbg !340
  %19 = load %class.GameList** %tmp, align 8, !dbg !340
  %curr6 = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !342
  %20 = load %class.GameList** %curr6, align 8, !dbg !342
  %next = getelementptr inbounds %class.GameList* %20, i32 0, i32 1, !dbg !342
  store %class.GameList* %19, %class.GameList** %next, align 8, !dbg !342
  %call7 = call i32 @_ZN12HexxagonGame4nextEv(%class.HexxagonGame* %this1), !dbg !343
  br label %if.end, !dbg !344

lpad:                                             ; preds = %2
  %21 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !345
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred9, i64** getelementptr inbounds ([2 x i64*]* @__llvm_gcda_edge_table8, i64 0, i64 1)), !dbg !345
  %22 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr7, i64 0, i64 6), !dbg !345
  %23 = add i64 %22, 1, !dbg !345
  store i64 %23, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr7, i64 0, i64 6), !dbg !345
  %24 = extractvalue { i8*, i32 } %21, 0, !dbg !345
  store i8* %24, i8** %exn.slot, !dbg !345
  %25 = extractvalue { i8*, i32 } %21, 1, !dbg !345
  store i32 %25, i32* %ehselector.slot, !dbg !345
  call void @_ZdlPv(i8* %call) #10, !dbg !345
  br label %eh.resume, !dbg !345

if.else:                                          ; preds = %invoke.cont
  %26 = load %class.GameList** %tmp, align 8, !dbg !346
  %isnull = icmp eq %class.GameList* %26, null, !dbg !347
  %27 = select i1 %isnull, i64 7, i64 8, !dbg !347
  %28 = getelementptr inbounds [12 x i64]* @__llvm_gcov_ctr7, i64 0, i64 %27, !dbg !347
  %29 = load i64* %28, !dbg !347
  %30 = add i64 %29, 1, !dbg !347
  store i64 %30, i64* %28, !dbg !347
  br i1 %isnull, label %delete.end, label %delete.notnull, !dbg !347

delete.notnull:                                   ; preds = %if.else
  %31 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr7, i64 0, i64 9), !dbg !348
  %32 = add i64 %31, 1, !dbg !348
  store i64 %32, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr7, i64 0, i64 9), !dbg !348
  %33 = bitcast %class.GameList* %26 to i8*, !dbg !348
  call void @_ZdlPv(i8* %33) #10, !dbg !348
  br label %delete.end, !dbg !348

delete.end:                                       ; preds = %delete.notnull, %if.else
  %34 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr7, i64 0, i64 10)
  %35 = add i64 %34, 1
  store i64 %35, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr7, i64 0, i64 10)
  br label %if.end

if.end:                                           ; preds = %delete.end, %if.then
  %36 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr7, i64 0, i64 11), !dbg !350
  %37 = add i64 %36, 1, !dbg !350
  store i64 %37, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr7, i64 0, i64 11), !dbg !350
  %38 = load i32* %ret, align 4, !dbg !350
  ret i32 %38, !dbg !351

eh.resume:                                        ; preds = %lpad
  %exn = load i8** %exn.slot, !dbg !352
  %sel = load i32* %ehselector.slot, !dbg !352
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !352
  %lpad.val8 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !352
  resume { i8*, i32 } %lpad.val8, !dbg !352
}

declare void @_ZN13HexxagonBoardaSERKS_(%class.HexxagonBoard* sret, %class.HexxagonBoard*, %class.HexxagonBoard* dereferenceable(16)) #2

declare i32 @_ZN13HexxagonBoard9applyMoveER12HexxagonMove(%class.HexxagonBoard*, %class.HexxagonMove* nonnull) #2

; Function Attrs: uwtable
define i32 @_ZN12HexxagonGame12computerMoveEiPFvvEi(%class.HexxagonGame* %this, i32 %depth, void ()* %callback, i32 %maxtime) #0 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr10, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr10, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonGame*, align 8
  %depth.addr = alloca i32, align 4
  %callback.addr = alloca void ()*, align 8
  %maxtime.addr = alloca i32, align 4
  %tmp = alloca %class.GameList*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %tmp3 = alloca %class.HexxagonBoard, align 4
  %ret = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  store i32 0, i32* @__llvm_gcov_global_state_pred12
  store %class.HexxagonGame* %this, %class.HexxagonGame** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonGame** %this.addr, metadata !353, metadata !225), !dbg !354
  store i32 %depth, i32* %depth.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %depth.addr, metadata !355, metadata !225), !dbg !356
  store void ()* %callback, void ()** %callback.addr, align 8
  call void @llvm.dbg.declare(metadata void ()** %callback.addr, metadata !357, metadata !225), !dbg !358
  store i32 %maxtime, i32* %maxtime.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %maxtime.addr, metadata !359, metadata !225), !dbg !360
  %this1 = load %class.HexxagonGame** %this.addr
  call void @llvm.dbg.declare(metadata %class.GameList** %tmp, metadata !361, metadata !225), !dbg !362
  %call = call noalias i8* @_Znwm(i64 32) #9, !dbg !363
  %3 = bitcast i8* %call to %class.GameList*, !dbg !363
  %curr = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !364
  %4 = load %class.GameList** %curr, align 8, !dbg !364
  invoke void @_ZN8GameListC2EPS_(%class.GameList* %3, %class.GameList* %4)
          to label %invoke.cont unwind label %lpad, !dbg !363

invoke.cont:                                      ; preds = %2
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred12, i64** getelementptr inbounds ([2 x i64*]* @__llvm_gcda_edge_table11, i64 0, i64 0)), !dbg !365
  store %class.GameList* %3, %class.GameList** %tmp, align 8, !dbg !365
  %5 = load %class.GameList** %tmp, align 8, !dbg !367
  %6 = bitcast %class.GameList* %5 to %class.HexxagonBoard*, !dbg !367
  %curr2 = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !368
  %7 = load %class.GameList** %curr2, align 8, !dbg !368
  %8 = bitcast %class.GameList* %7 to %class.HexxagonBoard*, !dbg !367
  call void @_ZN13HexxagonBoardaSERKS_(%class.HexxagonBoard* sret %tmp3, %class.HexxagonBoard* %6, %class.HexxagonBoard* dereferenceable(16) %8), !dbg !367
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !369, metadata !225), !dbg !370
  %9 = load %class.GameList** %tmp, align 8, !dbg !371
  %10 = bitcast %class.GameList* %9 to %class.HexxagonBoard*, !dbg !371
  %11 = load i32* %depth.addr, align 4, !dbg !372
  %12 = load void ()** %callback.addr, align 8, !dbg !373
  %13 = load i32* %maxtime.addr, align 4, !dbg !374
  %call5 = call i32 @_ZN13HexxagonBoard12computerMoveEiPFvvEi(%class.HexxagonBoard* %10, i32 %11, void ()* %12, i32 %13), !dbg !371
  store i32 %call5, i32* %ret, align 4, !dbg !370
  %14 = load i32* %ret, align 4, !dbg !375
  %tobool = icmp ne i32 %14, 0, !dbg !375
  %15 = select i1 %tobool, i64 3, i64 4, !dbg !377
  %16 = getelementptr inbounds [12 x i64]* @__llvm_gcov_ctr10, i64 0, i64 %15, !dbg !377
  %17 = load i64* %16, !dbg !377
  %18 = add i64 %17, 1, !dbg !377
  store i64 %18, i64* %16, !dbg !377
  br i1 %tobool, label %if.else, label %if.then, !dbg !377

if.then:                                          ; preds = %invoke.cont
  %19 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr10, i64 0, i64 5), !dbg !378
  %20 = add i64 %19, 1, !dbg !378
  store i64 %20, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr10, i64 0, i64 5), !dbg !378
  %21 = load %class.GameList** %tmp, align 8, !dbg !378
  %curr6 = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !380
  %22 = load %class.GameList** %curr6, align 8, !dbg !380
  %next = getelementptr inbounds %class.GameList* %22, i32 0, i32 1, !dbg !380
  store %class.GameList* %21, %class.GameList** %next, align 8, !dbg !380
  %call7 = call i32 @_ZN12HexxagonGame4nextEv(%class.HexxagonGame* %this1), !dbg !381
  br label %if.end, !dbg !382

lpad:                                             ; preds = %2
  %23 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !383
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred12, i64** getelementptr inbounds ([2 x i64*]* @__llvm_gcda_edge_table11, i64 0, i64 1)), !dbg !383
  %24 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr10, i64 0, i64 6), !dbg !383
  %25 = add i64 %24, 1, !dbg !383
  store i64 %25, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr10, i64 0, i64 6), !dbg !383
  %26 = extractvalue { i8*, i32 } %23, 0, !dbg !383
  store i8* %26, i8** %exn.slot, !dbg !383
  %27 = extractvalue { i8*, i32 } %23, 1, !dbg !383
  store i32 %27, i32* %ehselector.slot, !dbg !383
  call void @_ZdlPv(i8* %call) #10, !dbg !383
  br label %eh.resume, !dbg !383

if.else:                                          ; preds = %invoke.cont
  %28 = load %class.GameList** %tmp, align 8, !dbg !384
  %isnull = icmp eq %class.GameList* %28, null, !dbg !385
  %29 = select i1 %isnull, i64 7, i64 8, !dbg !385
  %30 = getelementptr inbounds [12 x i64]* @__llvm_gcov_ctr10, i64 0, i64 %29, !dbg !385
  %31 = load i64* %30, !dbg !385
  %32 = add i64 %31, 1, !dbg !385
  store i64 %32, i64* %30, !dbg !385
  br i1 %isnull, label %delete.end, label %delete.notnull, !dbg !385

delete.notnull:                                   ; preds = %if.else
  %33 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr10, i64 0, i64 9), !dbg !386
  %34 = add i64 %33, 1, !dbg !386
  store i64 %34, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr10, i64 0, i64 9), !dbg !386
  %35 = bitcast %class.GameList* %28 to i8*, !dbg !386
  call void @_ZdlPv(i8* %35) #10, !dbg !386
  br label %delete.end, !dbg !386

delete.end:                                       ; preds = %delete.notnull, %if.else
  %36 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr10, i64 0, i64 10)
  %37 = add i64 %36, 1
  store i64 %37, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr10, i64 0, i64 10)
  br label %if.end

if.end:                                           ; preds = %delete.end, %if.then
  %38 = load i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr10, i64 0, i64 11), !dbg !388
  %39 = add i64 %38, 1, !dbg !388
  store i64 %39, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr10, i64 0, i64 11), !dbg !388
  %40 = load i32* %ret, align 4, !dbg !388
  ret i32 %40, !dbg !389

eh.resume:                                        ; preds = %lpad
  %exn = load i8** %exn.slot, !dbg !390
  %sel = load i32* %ehselector.slot, !dbg !390
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !390
  %lpad.val8 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !390
  resume { i8*, i32 } %lpad.val8, !dbg !390
}

declare i32 @_ZN13HexxagonBoard12computerMoveEiPFvvEi(%class.HexxagonBoard*, i32, void ()*, i32) #2

; Function Attrs: nounwind uwtable
define i32 @_ZN12HexxagonGame8noBoardsEv(%class.HexxagonGame* %this) #5 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr13, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr13, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonGame*, align 8
  %step = alloca %class.GameList*, align 8
  %sum = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr13, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr13, i64 0, i64 1)
  store %class.HexxagonGame* %this, %class.HexxagonGame** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonGame** %this.addr, metadata !391, metadata !225), !dbg !392
  %this1 = load %class.HexxagonGame** %this.addr
  call void @llvm.dbg.declare(metadata %class.GameList** %step, metadata !393, metadata !225), !dbg !394
  %first = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 1, !dbg !395
  %5 = load %class.GameList** %first, align 8, !dbg !395
  store %class.GameList* %5, %class.GameList** %step, align 8, !dbg !394
  call void @llvm.dbg.declare(metadata i32* %sum, metadata !396, metadata !225), !dbg !397
  store i32 0, i32* %sum, align 4, !dbg !397
  br label %while.cond, !dbg !398

while.cond:                                       ; preds = %while.body, %2
  %6 = load %class.GameList** %step, align 8, !dbg !399
  %tobool = icmp ne %class.GameList* %6, null, !dbg !399
  %7 = select i1 %tobool, i64 2, i64 3, !dbg !398
  %8 = getelementptr inbounds [6 x i64]* @__llvm_gcov_ctr13, i64 0, i64 %7, !dbg !398
  %9 = load i64* %8, !dbg !398
  %10 = add i64 %9, 1, !dbg !398
  store i64 %10, i64* %8, !dbg !398
  br i1 %tobool, label %while.body, label %while.end, !dbg !398

while.body:                                       ; preds = %while.cond
  %11 = load i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr13, i64 0, i64 4), !dbg !402
  %12 = add i64 %11, 1, !dbg !402
  store i64 %12, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr13, i64 0, i64 4), !dbg !402
  %13 = load i32* %sum, align 4, !dbg !402
  %inc = add nsw i32 %13, 1, !dbg !402
  store i32 %inc, i32* %sum, align 4, !dbg !402
  %14 = load %class.GameList** %step, align 8, !dbg !404
  %next = getelementptr inbounds %class.GameList* %14, i32 0, i32 1, !dbg !404
  %15 = load %class.GameList** %next, align 8, !dbg !404
  store %class.GameList* %15, %class.GameList** %step, align 8, !dbg !405
  br label %while.cond, !dbg !398

while.end:                                        ; preds = %while.cond
  %16 = load i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr13, i64 0, i64 5), !dbg !406
  %17 = add i64 %16, 1, !dbg !406
  store i64 %17, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr13, i64 0, i64 5), !dbg !406
  %18 = load i32* %sum, align 4, !dbg !406
  ret i32 %18, !dbg !407
}

; Function Attrs: uwtable
define i32 @_ZN12HexxagonGame8loadGameEPc(%class.HexxagonGame* %this, i8* %filename) #0 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 0)
  %retval = alloca i32, align 4
  %this.addr = alloca %class.HexxagonGame*, align 8
  %filename.addr = alloca i8*, align 8
  %loadfile = alloca %struct._IO_FILE*, align 8
  %str = alloca [64 x i8], align 16
  %no = alloca i64, align 8
  %tmp = alloca %class.GameList*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %ret = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.HexxagonGame* %this, %class.HexxagonGame** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonGame** %this.addr, metadata !408, metadata !225), !dbg !409
  store i8* %filename, i8** %filename.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %filename.addr, metadata !410, metadata !225), !dbg !411
  %this1 = load %class.HexxagonGame** %this.addr
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %loadfile, metadata !412, metadata !225), !dbg !413
  %3 = load i8** %filename.addr, align 8, !dbg !414
  %call = call %struct._IO_FILE* @fopen(i8* %3, i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0)), !dbg !415
  store %struct._IO_FILE* %call, %struct._IO_FILE** %loadfile, align 8, !dbg !416
  %4 = load %struct._IO_FILE** %loadfile, align 8, !dbg !417
  %tobool = icmp ne %struct._IO_FILE* %4, null, !dbg !417
  %5 = select i1 %tobool, i64 1, i64 2, !dbg !419
  %6 = getelementptr inbounds [35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 %5, !dbg !419
  %7 = load i64* %6, !dbg !419
  %8 = add i64 %7, 1, !dbg !419
  store i64 %8, i64* %6, !dbg !419
  br i1 %tobool, label %if.end, label %if.then, !dbg !419

if.then:                                          ; preds = %2
  %9 = load i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 3), !dbg !420
  %10 = add i64 %9, 1, !dbg !420
  store i64 %10, i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 3), !dbg !420
  store i32 -1, i32* %retval, !dbg !420
  br label %return, !dbg !420

if.end:                                           ; preds = %2
  call void @llvm.dbg.declare(metadata [64 x i8]* %str, metadata !421, metadata !225), !dbg !425
  %arraydecay = getelementptr inbounds [64 x i8]* %str, i32 0, i32 0, !dbg !426
  %11 = load %struct._IO_FILE** %loadfile, align 8, !dbg !428
  %call2 = call i64 @fread(i8* %arraydecay, i64 13, i64 1, %struct._IO_FILE* %11), !dbg !429
  %cmp = icmp ne i64 %call2, 1, !dbg !429
  %12 = select i1 %cmp, i64 4, i64 5, !dbg !430
  %13 = getelementptr inbounds [35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 %12, !dbg !430
  %14 = load i64* %13, !dbg !430
  %15 = add i64 %14, 1, !dbg !430
  store i64 %15, i64* %13, !dbg !430
  br i1 %cmp, label %if.then3, label %if.end5, !dbg !430

if.then3:                                         ; preds = %if.end
  %16 = load i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 6), !dbg !431
  %17 = add i64 %16, 1, !dbg !431
  store i64 %17, i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 6), !dbg !431
  %18 = load %struct._IO_FILE** %loadfile, align 8, !dbg !431
  %call4 = call i32 @fclose(%struct._IO_FILE* %18), !dbg !433
  store i32 -2, i32* %retval, !dbg !434
  br label %return, !dbg !434

if.end5:                                          ; preds = %if.end
  %arraydecay6 = getelementptr inbounds [64 x i8]* %str, i32 0, i32 0, !dbg !435
  %call7 = call i32 @memcmp(i8* %arraydecay6, i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i64 13) #11, !dbg !437
  %tobool8 = icmp ne i32 %call7, 0, !dbg !437
  %19 = select i1 %tobool8, i64 7, i64 8, !dbg !438
  %20 = getelementptr inbounds [35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 %19, !dbg !438
  %21 = load i64* %20, !dbg !438
  %22 = add i64 %21, 1, !dbg !438
  store i64 %22, i64* %20, !dbg !438
  br i1 %tobool8, label %if.then9, label %if.end11, !dbg !438

if.then9:                                         ; preds = %if.end5
  %23 = load i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 9), !dbg !439
  %24 = add i64 %23, 1, !dbg !439
  store i64 %24, i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 9), !dbg !439
  %25 = load %struct._IO_FILE** %loadfile, align 8, !dbg !439
  %call10 = call i32 @fclose(%struct._IO_FILE* %25), !dbg !441
  store i32 -3, i32* %retval, !dbg !442
  br label %return, !dbg !442

if.end11:                                         ; preds = %if.end5
  call void @llvm.dbg.declare(metadata i64* %no, metadata !443, metadata !225), !dbg !444
  %26 = bitcast i64* %no to i8*, !dbg !445
  %27 = load %struct._IO_FILE** %loadfile, align 8, !dbg !447
  %call12 = call i64 @fread(i8* %26, i64 8, i64 1, %struct._IO_FILE* %27), !dbg !448
  %cmp13 = icmp ne i64 %call12, 1, !dbg !448
  %28 = select i1 %cmp13, i64 10, i64 11, !dbg !449
  %29 = getelementptr inbounds [35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 %28, !dbg !449
  %30 = load i64* %29, !dbg !449
  %31 = add i64 %30, 1, !dbg !449
  store i64 %31, i64* %29, !dbg !449
  br i1 %cmp13, label %if.then14, label %if.end16, !dbg !449

if.then14:                                        ; preds = %if.end11
  %32 = load i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 12), !dbg !450
  %33 = add i64 %32, 1, !dbg !450
  store i64 %33, i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 12), !dbg !450
  %34 = load %struct._IO_FILE** %loadfile, align 8, !dbg !450
  %call15 = call i32 @fclose(%struct._IO_FILE* %34), !dbg !452
  store i32 -2, i32* %retval, !dbg !453
  br label %return, !dbg !453

if.end16:                                         ; preds = %if.end11
  %35 = load i64* %no, align 8, !dbg !454
  %conv = trunc i64 %35 to i32, !dbg !454
  %call17 = call i32 @ntohl(i32 %conv) #1, !dbg !455
  %conv18 = zext i32 %call17 to i64, !dbg !455
  store i64 %conv18, i64* %no, align 8, !dbg !456
  %first = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 1, !dbg !457
  %36 = load %class.GameList** %first, align 8, !dbg !457
  %curr = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !458
  store %class.GameList* %36, %class.GameList** %curr, align 8, !dbg !458
  call void @_ZN12HexxagonGame11destroyRestEv(%class.HexxagonGame* %this1), !dbg !459
  %first19 = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 1, !dbg !460
  %37 = load %class.GameList** %first19, align 8, !dbg !460
  %isnull = icmp eq %class.GameList* %37, null, !dbg !461
  %38 = select i1 %isnull, i64 13, i64 14, !dbg !461
  %39 = getelementptr inbounds [35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 %38, !dbg !461
  %40 = load i64* %39, !dbg !461
  %41 = add i64 %40, 1, !dbg !461
  store i64 %41, i64* %39, !dbg !461
  br i1 %isnull, label %delete.end, label %delete.notnull, !dbg !461

delete.notnull:                                   ; preds = %if.end16
  %42 = load i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 15), !dbg !462
  %43 = add i64 %42, 1, !dbg !462
  store i64 %43, i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 15), !dbg !462
  %44 = bitcast %class.GameList* %37 to i8*, !dbg !462
  call void @_ZdlPv(i8* %44) #10, !dbg !462
  br label %delete.end, !dbg !462

delete.end:                                       ; preds = %delete.notnull, %if.end16
  %45 = load i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 16), !dbg !464
  %46 = add i64 %45, 1, !dbg !464
  store i64 %46, i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 16), !dbg !464
  %first20 = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 1, !dbg !464
  store %class.GameList* null, %class.GameList** %first20, align 8, !dbg !464
  %turn = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 0, !dbg !465
  store i32 1, i32* %turn, align 4, !dbg !465
  br label %while.cond, !dbg !466

while.cond:                                       ; preds = %if.end40, %delete.end
  %47 = load i64* %no, align 8, !dbg !467
  %tobool21 = icmp ne i64 %47, 0, !dbg !467
  %48 = select i1 %tobool21, i64 17, i64 18, !dbg !466
  %49 = getelementptr inbounds [35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 %48, !dbg !466
  %50 = load i64* %49, !dbg !466
  %51 = add i64 %50, 1, !dbg !466
  store i64 %51, i64* %49, !dbg !466
  br i1 %tobool21, label %while.body, label %while.end, !dbg !466

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata %class.GameList** %tmp, metadata !469, metadata !225), !dbg !471
  %first22 = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 1, !dbg !472
  %52 = load %class.GameList** %first22, align 8, !dbg !472
  %cmp23 = icmp eq %class.GameList* %52, null, !dbg !472
  %53 = select i1 %cmp23, i64 19, i64 20, !dbg !474
  %54 = getelementptr inbounds [35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 %53, !dbg !474
  %55 = load i64* %54, !dbg !474
  %56 = add i64 %55, 1, !dbg !474
  store i64 %56, i64* %54, !dbg !474
  br i1 %cmp23, label %if.then24, label %if.else, !dbg !474

if.then24:                                        ; preds = %while.body
  store i32 0, i32* @__llvm_gcov_global_state_pred16, !dbg !475
  %call25 = call noalias i8* @_Znwm(i64 32) #9, !dbg !475
  %57 = bitcast i8* %call25 to %class.GameList*, !dbg !475
  invoke void @_ZN8GameListC2EPS_(%class.GameList* %57, %class.GameList* null)
          to label %invoke.cont unwind label %lpad, !dbg !475

invoke.cont:                                      ; preds = %if.then24
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred16, i64** getelementptr inbounds ([8 x i64*]* @__llvm_gcda_edge_table15, i64 0, i64 0)), !dbg !477
  %58 = load i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 23), !dbg !477
  %59 = add i64 %58, 1, !dbg !477
  store i64 %59, i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 23), !dbg !477
  store %class.GameList* %57, %class.GameList** %tmp, align 8, !dbg !477
  %60 = load %class.GameList** %tmp, align 8, !dbg !479
  %first26 = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 1, !dbg !480
  store %class.GameList* %60, %class.GameList** %first26, align 8, !dbg !480
  %61 = load %class.GameList** %tmp, align 8, !dbg !481
  %curr27 = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !482
  store %class.GameList* %61, %class.GameList** %curr27, align 8, !dbg !482
  br label %if.end34, !dbg !483

lpad:                                             ; preds = %if.then24
  %62 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !484
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred16, i64** getelementptr inbounds ([8 x i64*]* @__llvm_gcda_edge_table15, i64 0, i64 2)), !dbg !484
  %63 = load i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 24), !dbg !484
  %64 = add i64 %63, 1, !dbg !484
  store i64 %64, i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 24), !dbg !484
  %65 = extractvalue { i8*, i32 } %62, 0, !dbg !484
  store i8* %65, i8** %exn.slot, !dbg !484
  %66 = extractvalue { i8*, i32 } %62, 1, !dbg !484
  store i32 %66, i32* %ehselector.slot, !dbg !484
  call void @_ZdlPv(i8* %call25) #10, !dbg !484
  br label %eh.resume, !dbg !484

if.else:                                          ; preds = %while.body
  store i32 1, i32* @__llvm_gcov_global_state_pred16, !dbg !485
  %call28 = call noalias i8* @_Znwm(i64 32) #9, !dbg !485
  %67 = bitcast i8* %call28 to %class.GameList*, !dbg !485
  %curr29 = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !487
  %68 = load %class.GameList** %curr29, align 8, !dbg !487
  invoke void @_ZN8GameListC2EPS_(%class.GameList* %67, %class.GameList* %68)
          to label %invoke.cont31 unwind label %lpad30, !dbg !485

invoke.cont31:                                    ; preds = %if.else
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred16, i64** getelementptr inbounds ([8 x i64*]* @__llvm_gcda_edge_table15, i64 0, i64 4)), !dbg !488
  %69 = load i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 27), !dbg !488
  %70 = add i64 %69, 1, !dbg !488
  store i64 %70, i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 27), !dbg !488
  store %class.GameList* %67, %class.GameList** %tmp, align 8, !dbg !488
  %71 = load %class.GameList** %tmp, align 8, !dbg !490
  %curr32 = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !491
  %72 = load %class.GameList** %curr32, align 8, !dbg !491
  %next = getelementptr inbounds %class.GameList* %72, i32 0, i32 1, !dbg !491
  store %class.GameList* %71, %class.GameList** %next, align 8, !dbg !491
  %call33 = call i32 @_ZN12HexxagonGame4nextEv(%class.HexxagonGame* %this1), !dbg !492
  br label %if.end34

lpad30:                                           ; preds = %if.else
  %73 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !493
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred16, i64** getelementptr inbounds ([8 x i64*]* @__llvm_gcda_edge_table15, i64 0, i64 6)), !dbg !493
  %74 = load i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 28), !dbg !493
  %75 = add i64 %74, 1, !dbg !493
  store i64 %75, i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 28), !dbg !493
  %76 = extractvalue { i8*, i32 } %73, 0, !dbg !493
  store i8* %76, i8** %exn.slot, !dbg !493
  %77 = extractvalue { i8*, i32 } %73, 1, !dbg !493
  store i32 %77, i32* %ehselector.slot, !dbg !493
  call void @_ZdlPv(i8* %call28) #10, !dbg !493
  br label %eh.resume, !dbg !493

if.end34:                                         ; preds = %invoke.cont31, %invoke.cont
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !494, metadata !225), !dbg !495
  %78 = load %class.GameList** %tmp, align 8, !dbg !496
  %79 = bitcast %class.GameList* %78 to %class.HexxagonBoard*, !dbg !496
  %80 = load %struct._IO_FILE** %loadfile, align 8, !dbg !497
  %call36 = call i32 @_ZN13HexxagonBoard12readFromFileEP8_IO_FILE(%class.HexxagonBoard* %79, %struct._IO_FILE* %80), !dbg !496
  store i32 %call36, i32* %ret, align 4, !dbg !495
  %81 = load i32* %ret, align 4, !dbg !498
  %tobool37 = icmp ne i32 %81, 0, !dbg !498
  %82 = select i1 %tobool37, i64 29, i64 30, !dbg !500
  %83 = getelementptr inbounds [35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 %82, !dbg !500
  %84 = load i64* %83, !dbg !500
  %85 = add i64 %84, 1, !dbg !500
  store i64 %85, i64* %83, !dbg !500
  br i1 %tobool37, label %if.then38, label %if.end40, !dbg !500

if.then38:                                        ; preds = %if.end34
  %86 = load i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 31), !dbg !501
  %87 = add i64 %86, 1, !dbg !501
  store i64 %87, i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 31), !dbg !501
  %call39 = call i32 @_ZN12HexxagonGame4prevEv(%class.HexxagonGame* %this1), !dbg !501
  call void @_ZN12HexxagonGame11destroyRestEv(%class.HexxagonGame* %this1), !dbg !503
  %88 = load i32* %ret, align 4, !dbg !504
  store i32 %88, i32* %retval, !dbg !505
  br label %return, !dbg !505

if.end40:                                         ; preds = %if.end34
  %89 = load i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 32), !dbg !506
  %90 = add i64 %89, 1, !dbg !506
  store i64 %90, i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 32), !dbg !506
  %91 = load i64* %no, align 8, !dbg !506
  %dec = add nsw i64 %91, -1, !dbg !506
  store i64 %dec, i64* %no, align 8, !dbg !506
  br label %while.cond, !dbg !466

while.end:                                        ; preds = %while.cond
  %92 = load i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 33), !dbg !507
  %93 = add i64 %92, 1, !dbg !507
  store i64 %93, i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 33), !dbg !507
  %94 = load %struct._IO_FILE** %loadfile, align 8, !dbg !507
  %call41 = call i32 @fclose(%struct._IO_FILE* %94), !dbg !508
  store i32 0, i32* %retval, !dbg !509
  br label %return, !dbg !509

return:                                           ; preds = %while.end, %if.then38, %if.then14, %if.then9, %if.then3, %if.then
  %95 = load i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 34), !dbg !510
  %96 = add i64 %95, 1, !dbg !510
  store i64 %96, i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 34), !dbg !510
  %97 = load i32* %retval, !dbg !510
  ret i32 %97, !dbg !510

eh.resume:                                        ; preds = %lpad30, %lpad
  %exn = load i8** %exn.slot, !dbg !511
  %sel = load i32* %ehselector.slot, !dbg !511
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !511
  %lpad.val42 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !511
  resume { i8*, i32 } %lpad.val42, !dbg !511
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #2

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind readonly
declare i32 @memcmp(i8*, i8*, i64) #6

; Function Attrs: nounwind readnone
declare i32 @ntohl(i32) #7

declare i32 @_ZN13HexxagonBoard12readFromFileEP8_IO_FILE(%class.HexxagonBoard*, %struct._IO_FILE*) #2

; Function Attrs: uwtable
define i32 @_ZN12HexxagonGame8saveGameEPc(%class.HexxagonGame* %this, i8* %filename) #0 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 0)
  %retval = alloca i32, align 4
  %this.addr = alloca %class.HexxagonGame*, align 8
  %filename.addr = alloca i8*, align 8
  %savefile = alloca %struct._IO_FILE*, align 8
  %no = alloca i64, align 8
  %step = alloca %class.GameList*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.HexxagonGame* %this, %class.HexxagonGame** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonGame** %this.addr, metadata !513, metadata !225), !dbg !514
  store i8* %filename, i8** %filename.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %filename.addr, metadata !515, metadata !225), !dbg !516
  %this1 = load %class.HexxagonGame** %this.addr
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %savefile, metadata !517, metadata !225), !dbg !518
  %3 = load i8** %filename.addr, align 8, !dbg !519
  %call = call %struct._IO_FILE* @fopen(i8* %3, i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0)), !dbg !520
  store %struct._IO_FILE* %call, %struct._IO_FILE** %savefile, align 8, !dbg !521
  %4 = load %struct._IO_FILE** %savefile, align 8, !dbg !522
  %tobool = icmp ne %struct._IO_FILE* %4, null, !dbg !522
  %5 = select i1 %tobool, i64 1, i64 2, !dbg !524
  %6 = getelementptr inbounds [19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 %5, !dbg !524
  %7 = load i64* %6, !dbg !524
  %8 = add i64 %7, 1, !dbg !524
  store i64 %8, i64* %6, !dbg !524
  br i1 %tobool, label %if.end, label %if.then, !dbg !524

if.then:                                          ; preds = %2
  %9 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 3), !dbg !525
  %10 = add i64 %9, 1, !dbg !525
  store i64 %10, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 3), !dbg !525
  store i32 -1, i32* %retval, !dbg !525
  br label %return, !dbg !525

if.end:                                           ; preds = %2
  %11 = load %struct._IO_FILE** %savefile, align 8, !dbg !526
  %call2 = call i64 @fwrite(i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i64 13, i64 1, %struct._IO_FILE* %11), !dbg !528
  %cmp = icmp ne i64 %call2, 1, !dbg !528
  %12 = select i1 %cmp, i64 4, i64 5, !dbg !529
  %13 = getelementptr inbounds [19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 %12, !dbg !529
  %14 = load i64* %13, !dbg !529
  %15 = add i64 %14, 1, !dbg !529
  store i64 %15, i64* %13, !dbg !529
  br i1 %cmp, label %if.then3, label %if.end5, !dbg !529

if.then3:                                         ; preds = %if.end
  %16 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 6), !dbg !530
  %17 = add i64 %16, 1, !dbg !530
  store i64 %17, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 6), !dbg !530
  %18 = load %struct._IO_FILE** %savefile, align 8, !dbg !530
  %call4 = call i32 @fclose(%struct._IO_FILE* %18), !dbg !532
  store i32 -2, i32* %retval, !dbg !533
  br label %return, !dbg !533

if.end5:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i64* %no, metadata !534, metadata !225), !dbg !535
  %call6 = call i32 @_ZN12HexxagonGame8noBoardsEv(%class.HexxagonGame* %this1), !dbg !536
  %call7 = call i32 @htonl(i32 %call6) #1, !dbg !537
  %conv = zext i32 %call7 to i64, !dbg !537
  store i64 %conv, i64* %no, align 8, !dbg !538
  %19 = bitcast i64* %no to i8*, !dbg !539
  %20 = load %struct._IO_FILE** %savefile, align 8, !dbg !541
  %call8 = call i64 @fwrite(i8* %19, i64 8, i64 1, %struct._IO_FILE* %20), !dbg !542
  %cmp9 = icmp ne i64 %call8, 1, !dbg !542
  %21 = select i1 %cmp9, i64 7, i64 8, !dbg !543
  %22 = getelementptr inbounds [19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 %21, !dbg !543
  %23 = load i64* %22, !dbg !543
  %24 = add i64 %23, 1, !dbg !543
  store i64 %24, i64* %22, !dbg !543
  br i1 %cmp9, label %if.then10, label %if.end12, !dbg !543

if.then10:                                        ; preds = %if.end5
  %25 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 9), !dbg !544
  %26 = add i64 %25, 1, !dbg !544
  store i64 %26, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 9), !dbg !544
  %27 = load %struct._IO_FILE** %savefile, align 8, !dbg !544
  %call11 = call i32 @fclose(%struct._IO_FILE* %27), !dbg !546
  store i32 -2, i32* %retval, !dbg !547
  br label %return, !dbg !547

if.end12:                                         ; preds = %if.end5
  %28 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 10), !dbg !548
  %29 = add i64 %28, 1, !dbg !548
  store i64 %29, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 10), !dbg !548
  call void @llvm.dbg.declare(metadata %class.GameList** %step, metadata !549, metadata !225), !dbg !548
  %first = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 1, !dbg !550
  %30 = load %class.GameList** %first, align 8, !dbg !550
  store %class.GameList* %30, %class.GameList** %step, align 8, !dbg !548
  br label %while.cond, !dbg !551

while.cond:                                       ; preds = %if.end18, %if.end12
  %31 = load %class.GameList** %step, align 8, !dbg !552
  %tobool13 = icmp ne %class.GameList* %31, null, !dbg !552
  %32 = select i1 %tobool13, i64 11, i64 12, !dbg !551
  %33 = getelementptr inbounds [19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 %32, !dbg !551
  %34 = load i64* %33, !dbg !551
  %35 = add i64 %34, 1, !dbg !551
  store i64 %35, i64* %33, !dbg !551
  br i1 %tobool13, label %while.body, label %while.end, !dbg !551

while.body:                                       ; preds = %while.cond
  %36 = load %class.GameList** %step, align 8, !dbg !555
  %37 = bitcast %class.GameList* %36 to %class.HexxagonBoard*, !dbg !555
  %38 = load %struct._IO_FILE** %savefile, align 8, !dbg !558
  %call14 = call i32 @_ZN13HexxagonBoard11writeToFileEP8_IO_FILE(%class.HexxagonBoard* %37, %struct._IO_FILE* %38), !dbg !555
  %tobool15 = icmp ne i32 %call14, 0, !dbg !555
  %39 = select i1 %tobool15, i64 13, i64 14, !dbg !559
  %40 = getelementptr inbounds [19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 %39, !dbg !559
  %41 = load i64* %40, !dbg !559
  %42 = add i64 %41, 1, !dbg !559
  store i64 %42, i64* %40, !dbg !559
  br i1 %tobool15, label %if.then16, label %if.end18, !dbg !559

if.then16:                                        ; preds = %while.body
  %43 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 15), !dbg !560
  %44 = add i64 %43, 1, !dbg !560
  store i64 %44, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 15), !dbg !560
  %45 = load %struct._IO_FILE** %savefile, align 8, !dbg !560
  %call17 = call i32 @fclose(%struct._IO_FILE* %45), !dbg !562
  store i32 -2, i32* %retval, !dbg !563
  br label %return, !dbg !563

if.end18:                                         ; preds = %while.body
  %46 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 16), !dbg !564
  %47 = add i64 %46, 1, !dbg !564
  store i64 %47, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 16), !dbg !564
  %48 = load %class.GameList** %step, align 8, !dbg !564
  %next = getelementptr inbounds %class.GameList* %48, i32 0, i32 1, !dbg !564
  %49 = load %class.GameList** %next, align 8, !dbg !564
  store %class.GameList* %49, %class.GameList** %step, align 8, !dbg !565
  br label %while.cond, !dbg !551

while.end:                                        ; preds = %while.cond
  %50 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 17), !dbg !566
  %51 = add i64 %50, 1, !dbg !566
  store i64 %51, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 17), !dbg !566
  %52 = load %struct._IO_FILE** %savefile, align 8, !dbg !566
  %call19 = call i32 @fclose(%struct._IO_FILE* %52), !dbg !567
  store i32 0, i32* %retval, !dbg !568
  br label %return, !dbg !568

return:                                           ; preds = %while.end, %if.then16, %if.then10, %if.then3, %if.then
  %53 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 18), !dbg !569
  %54 = add i64 %53, 1, !dbg !569
  store i64 %54, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 18), !dbg !569
  %55 = load i32* %retval, !dbg !569
  ret i32 %55, !dbg !569
}

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #2

; Function Attrs: nounwind readnone
declare i32 @htonl(i32) #7

declare i32 @_ZN13HexxagonBoard11writeToFileEP8_IO_FILE(%class.HexxagonBoard*, %struct._IO_FILE*) #2

; Function Attrs: uwtable
define linkonce_odr void @_ZN13HexxagonBoardC2Ev(%class.HexxagonBoard* %this) unnamed_addr #0 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr19, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr19, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonBoard*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr19, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr19, i64 0, i64 1)
  store %class.HexxagonBoard* %this, %class.HexxagonBoard** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonBoard** %this.addr, metadata !570, metadata !225), !dbg !571
  %this1 = load %class.HexxagonBoard** %this.addr
  %board = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 0, !dbg !572
  call void @_ZN10BitBoard64C2Ev(%class.BitBoard64* %board), !dbg !572
  %color = getelementptr inbounds %class.HexxagonBoard* %this1, i32 0, i32 1, !dbg !572
  call void @_ZN10BitBoard64C2Ev(%class.BitBoard64* %color), !dbg !572
  ret void, !dbg !573
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN10BitBoard64C2Ev(%class.BitBoard64* %this) unnamed_addr #5 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr20, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr20, i64 0, i64 0)
  %this.addr = alloca %class.BitBoard64*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr20, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr20, i64 0, i64 1)
  store %class.BitBoard64* %this, %class.BitBoard64** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.BitBoard64** %this.addr, metadata !574, metadata !225), !dbg !576
  %this1 = load %class.BitBoard64** %this.addr
  ret void, !dbg !577
}

; Function Attrs: noinline
define internal void @__llvm_gcov_indirect_counter_increment(i32* %predecessor, i64** %counters) unnamed_addr #8 {
entry:
  %pred = load i32* %predecessor
  %0 = icmp eq i32 %pred, -1
  br i1 %0, label %exit, label %1

; <label>:1                                       ; preds = %entry
  %2 = zext i32 %pred to i64
  %3 = getelementptr i64** %counters, i64 %2
  %counter = load i64** %3
  %4 = icmp eq i64* %counter, null
  br i1 %4, label %exit, label %5

; <label>:5                                       ; preds = %1
  %6 = load i64* %counter
  %7 = add i64 %6, 1
  store i64 %7, i64* %counter
  br label %exit

exit:                                             ; preds = %5, %1, %entry
  ret void
}

; Function Attrs: noinline
define internal void @__llvm_gcov_writeout() unnamed_addr #8 {
entry:
  call void @llvm_gcda_start_file(i8* getelementptr inbounds ([94 x i8]* @1, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @0, i32 0, i32 0), i32 -100735119)
  call void @llvm_gcda_emit_function(i32 0, i8* getelementptr inbounds ([22 x i8]* @2, i32 0, i32 0), i32 -579803927, i8 0, i32 -100735119)
  call void @llvm_gcda_emit_arcs(i32 11, i64* getelementptr inbounds ([11 x i64]* @__llvm_gcov_ctr, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 1, i8* getelementptr inbounds ([25 x i8]* @3, i32 0, i32 0), i32 1201465186, i8 0, i32 -100735119)
  call void @llvm_gcda_emit_arcs(i32 6, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr3, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 2, i8* getelementptr inbounds ([25 x i8]* @4, i32 0, i32 0), i32 -2006411890, i8 0, i32 -100735119)
  call void @llvm_gcda_emit_arcs(i32 6, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr4, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 3, i8* getelementptr inbounds ([26 x i8]* @5, i32 0, i32 0), i32 -32527634, i8 0, i32 -100735119)
  call void @llvm_gcda_emit_arcs(i32 6, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr5, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 4, i8* getelementptr inbounds ([33 x i8]* @6, i32 0, i32 0), i32 -1068284982, i8 0, i32 -100735119)
  call void @llvm_gcda_emit_arcs(i32 9, i64* getelementptr inbounds ([9 x i64]* @__llvm_gcov_ctr6, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 5, i8* getelementptr inbounds ([44 x i8]* @7, i32 0, i32 0), i32 523081902, i8 0, i32 -100735119)
  call void @llvm_gcda_emit_arcs(i32 12, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr7, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 6, i8* getelementptr inbounds ([40 x i8]* @8, i32 0, i32 0), i32 1235774954, i8 0, i32 -100735119)
  call void @llvm_gcda_emit_arcs(i32 12, i64* getelementptr inbounds ([12 x i64]* @__llvm_gcov_ctr10, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 7, i8* getelementptr inbounds ([29 x i8]* @9, i32 0, i32 0), i32 1139470781, i8 0, i32 -100735119)
  call void @llvm_gcda_emit_arcs(i32 6, i64* getelementptr inbounds ([6 x i64]* @__llvm_gcov_ctr13, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 8, i8* getelementptr inbounds ([30 x i8]* @10, i32 0, i32 0), i32 -1293113371, i8 0, i32 -100735119)
  call void @llvm_gcda_emit_arcs(i32 35, i64* getelementptr inbounds ([35 x i64]* @__llvm_gcov_ctr14, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 9, i8* getelementptr inbounds ([30 x i8]* @11, i32 0, i32 0), i32 -634639441, i8 0, i32 -100735119)
  call void @llvm_gcda_emit_arcs(i32 19, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr17, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 10, i8* getelementptr inbounds ([19 x i8]* @12, i32 0, i32 0), i32 1398288610, i8 0, i32 -100735119)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr18, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 11, i8* getelementptr inbounds ([23 x i8]* @13, i32 0, i32 0), i32 1805941311, i8 0, i32 -100735119)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr19, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 12, i8* getelementptr inbounds ([20 x i8]* @14, i32 0, i32 0), i32 -196194665, i8 0, i32 -100735119)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr20, i64 0, i64 0))
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
define internal void @__llvm_gcov_flush() unnamed_addr #8 {
entry:
  call void @__llvm_gcov_writeout()
  store [11 x i64] zeroinitializer, [11 x i64]* @__llvm_gcov_ctr
  store [6 x i64] zeroinitializer, [6 x i64]* @__llvm_gcov_ctr3
  store [6 x i64] zeroinitializer, [6 x i64]* @__llvm_gcov_ctr4
  store [6 x i64] zeroinitializer, [6 x i64]* @__llvm_gcov_ctr5
  store [9 x i64] zeroinitializer, [9 x i64]* @__llvm_gcov_ctr6
  store [12 x i64] zeroinitializer, [12 x i64]* @__llvm_gcov_ctr7
  store [12 x i64] zeroinitializer, [12 x i64]* @__llvm_gcov_ctr10
  store [6 x i64] zeroinitializer, [6 x i64]* @__llvm_gcov_ctr13
  store [35 x i64] zeroinitializer, [35 x i64]* @__llvm_gcov_ctr14
  store [19 x i64] zeroinitializer, [19 x i64]* @__llvm_gcov_ctr17
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr18
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr19
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr20
  ret void
}

; Function Attrs: noinline
define internal void @__llvm_gcov_init() unnamed_addr #8 {
entry:
  call void @llvm_gcov_init(void ()* @__llvm_gcov_writeout, void ()* @__llvm_gcov_flush)
  ret void
}

declare void @llvm_gcov_init(void ()*, void ()*)

attributes #0 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nobuiltin "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nobuiltin nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noinline }
attributes #9 = { builtin }
attributes #10 = { builtin nounwind }
attributes #11 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!219, !220}
!llvm.gcov = !{!221}
!llvm.ident = !{!222}

!0 = !{!"0x11\004\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !3, !205, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp] [DW_LANG_C_plus_plus]
!1 = !{!"hexxagongame.cpp", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!2 = !{}
!3 = !{!4, !48, !57, !108, !150, !202, !203, !204}
!4 = !{!"0x2\00HexxagonGame\0037\00192\0064\000\000\000", !5, null, null, !6, null, null, !"_ZTS12HexxagonGame"} ; [ DW_TAG_class_type ] [HexxagonGame] [line 37, size 192, align 64, offset 0] [def] [from ]
!5 = !{!"./hexxagongame.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!6 = !{!7, !9, !11, !12, !16, !17, !20, !21, !22, !23, !24, !28, !34, !35, !39, !40, !41, !42, !47}
!7 = !{!"0xd\00turn\0067\0032\0032\000\002", !5, !"_ZTS12HexxagonGame", !8} ; [ DW_TAG_member ] [turn] [line 67, size 32, align 32, offset 0] [protected] [from int]
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0xd\00first\0069\0064\0064\0064\002", !5, !"_ZTS12HexxagonGame", !10} ; [ DW_TAG_member ] [first] [line 69, size 64, align 64, offset 64] [protected] [from ]
!10 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS8GameList"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS8GameList]
!11 = !{!"0xd\00curr\0070\0064\0064\00128\002", !5, !"_ZTS12HexxagonGame", !10} ; [ DW_TAG_member ] [curr] [line 70, size 64, align 64, offset 128] [protected] [from ]
!12 = !{!"0x2e\00HexxagonGame\00HexxagonGame\00\0040\000\000\000\000\00259\000\0040", !5, !"_ZTS12HexxagonGame", !13, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 40] [public] [HexxagonGame]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{null, !15}
!15 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS12HexxagonGame"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS12HexxagonGame]
!16 = !{!"0x2e\00~HexxagonGame\00~HexxagonGame\00\0041\000\000\000\000\00259\000\0041", !5, !"_ZTS12HexxagonGame", !13, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 41] [public] [~HexxagonGame]
!17 = !{!"0x2e\00getTurn\00getTurn\00_ZN12HexxagonGame7getTurnEv\0043\000\000\000\000\00259\000\0043", !5, !"_ZTS12HexxagonGame", !18, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 43] [public] [getTurn]
!18 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !19, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = !{!8, !15}
!20 = !{!"0x2e\00next\00next\00_ZN12HexxagonGame4nextEv\0045\000\000\000\000\00259\000\0045", !5, !"_ZTS12HexxagonGame", !18, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 45] [public] [next]
!21 = !{!"0x2e\00prev\00prev\00_ZN12HexxagonGame4prevEv\0046\000\000\000\000\00259\000\0046", !5, !"_ZTS12HexxagonGame", !18, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 46] [public] [prev]
!22 = !{!"0x2e\00reset\00reset\00_ZN12HexxagonGame5resetEv\0048\000\000\000\000\00259\000\0048", !5, !"_ZTS12HexxagonGame", !13, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 48] [public] [reset]
!23 = !{!"0x2e\00destroyRest\00destroyRest\00_ZN12HexxagonGame11destroyRestEv\0049\000\000\000\000\00259\000\0049", !5, !"_ZTS12HexxagonGame", !13, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 49] [public] [destroyRest]
!24 = !{!"0x2e\00applyMove\00applyMove\00_ZN12HexxagonGame9applyMoveER12HexxagonMove\0051\000\000\000\000\00259\000\0051", !5, !"_ZTS12HexxagonGame", !25, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 51] [public] [applyMove]
!25 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !26, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!26 = !{!8, !15, !27}
!27 = !{!"0x10\00\000\000\000\000\000", null, null, !"_ZTS12HexxagonMove"} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from _ZTS12HexxagonMove]
!28 = !{!"0x2e\00computerMove\00computerMove\00_ZN12HexxagonGame12computerMoveEiPFvvEi\0052\000\000\000\000\00259\000\0052", !5, !"_ZTS12HexxagonGame", !29, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 52] [public] [computerMove]
!29 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !30, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = !{!8, !15, !8, !31, !8}
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!32 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !33, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!33 = !{null}
!34 = !{!"0x2e\00noBoards\00noBoards\00_ZN12HexxagonGame8noBoardsEv\0054\000\000\000\000\00259\000\0054", !5, !"_ZTS12HexxagonGame", !18, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 54] [public] [noBoards]
!35 = !{!"0x2e\00getBoard\00getBoard\00_ZN12HexxagonGame8getBoardEv\0056\000\000\000\000\00259\000\0056", !5, !"_ZTS12HexxagonGame", !36, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 56] [public] [getBoard]
!36 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !37, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!37 = !{!38, !15}
!38 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS13HexxagonBoard"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS13HexxagonBoard]
!39 = !{!"0x2e\00endOfGame\00endOfGame\00_ZN12HexxagonGame9endOfGameEv\0058\000\000\000\000\00259\000\0058", !5, !"_ZTS12HexxagonGame", !18, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 58] [public] [endOfGame]
!40 = !{!"0x2e\00isMoveValid\00isMoveValid\00_ZN12HexxagonGame11isMoveValidER12HexxagonMove\0059\000\000\000\000\00259\000\0059", !5, !"_ZTS12HexxagonGame", !25, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 59] [public] [isMoveValid]
!41 = !{!"0x2e\00displayText\00displayText\00_ZN12HexxagonGame11displayTextEv\0061\000\000\000\000\00259\000\0061", !5, !"_ZTS12HexxagonGame", !13, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 61] [public] [displayText]
!42 = !{!"0x2e\00saveGame\00saveGame\00_ZN12HexxagonGame8saveGameEPc\0063\000\000\000\000\00259\000\0063", !5, !"_ZTS12HexxagonGame", !43, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 63] [public] [saveGame]
!43 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !44, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!44 = !{!8, !15, !45}
!45 = !{!"0xf\00\000\0064\0064\000\000", null, null, !46} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!46 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!47 = !{!"0x2e\00loadGame\00loadGame\00_ZN12HexxagonGame8loadGameEPc\0064\000\000\000\000\00259\000\0064", !5, !"_ZTS12HexxagonGame", !43, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 64] [public] [loadGame]
!48 = !{!"0x2\00GameList\0028\00256\0064\000\000\000", !5, null, null, !49, null, null, !"_ZTS8GameList"} ; [ DW_TAG_class_type ] [GameList] [line 28, size 256, align 64, offset 0] [def] [from ]
!49 = !{!50, !51, !52, !53}
!50 = !{!"0x1c\00\000\000\000\000\003", null, !"_ZTS8GameList", !"_ZTS13HexxagonBoard"} ; [ DW_TAG_inheritance ] [line 0, size 0, align 0, offset 0] [public] [from _ZTS13HexxagonBoard]
!51 = !{!"0xd\00next\0033\0064\0064\00128\003", !5, !"_ZTS8GameList", !10} ; [ DW_TAG_member ] [next] [line 33, size 64, align 64, offset 128] [public] [from ]
!52 = !{!"0xd\00prev\0034\0064\0064\00192\003", !5, !"_ZTS8GameList", !10} ; [ DW_TAG_member ] [prev] [line 34, size 64, align 64, offset 192] [public] [from ]
!53 = !{!"0x2e\00GameList\00GameList\00\0031\000\000\000\000\00259\000\0031", !5, !"_ZTS8GameList", !54, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 31] [public] [GameList]
!54 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !55, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!55 = !{null, !56, !10}
!56 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS8GameList"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS8GameList]
!57 = !{!"0x2\00HexxagonBoard\0050\00128\0032\000\000\000", !58, null, null, !59, null, null, !"_ZTS13HexxagonBoard"} ; [ DW_TAG_class_type ] [HexxagonBoard] [line 50, size 128, align 32, offset 0] [def] [from ]
!58 = !{!"./hexxagonboard.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!59 = !{!60, !61, !62, !66, !71, !72, !75, !78, !79, !82, !86, !89, !90, !91, !94, !95, !98, !104, !105}
!60 = !{!"0xd\00board\0080\0064\0032\000\002", !58, !"_ZTS13HexxagonBoard", !"_ZTS10BitBoard64"} ; [ DW_TAG_member ] [board] [line 80, size 64, align 32, offset 0] [protected] [from _ZTS10BitBoard64]
!61 = !{!"0xd\00color\0081\0064\0032\0064\002", !58, !"_ZTS13HexxagonBoard", !"_ZTS10BitBoard64"} ; [ DW_TAG_member ] [color] [line 81, size 64, align 32, offset 64] [protected] [from _ZTS10BitBoard64]
!62 = !{!"0x2e\00HexxagonBoard\00HexxagonBoard\00\0054\000\000\000\000\00259\000\0054", !58, !"_ZTS13HexxagonBoard", !63, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 54] [public] [HexxagonBoard]
!63 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !64, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = !{null, !65}
!65 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS13HexxagonBoard"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS13HexxagonBoard]
!66 = !{!"0x2e\00HexxagonBoard\00HexxagonBoard\00\0055\000\000\000\000\00259\000\0055", !58, !"_ZTS13HexxagonBoard", !67, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 55] [public] [HexxagonBoard]
!67 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !68, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!68 = !{null, !65, !69}
!69 = !{!"0x10\00\000\000\000\000\000", null, null, !70} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!70 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS13HexxagonBoard"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS13HexxagonBoard]
!71 = !{!"0x2e\00init\00init\00_ZN13HexxagonBoard4initEv\0057\000\000\000\000\00259\000\0057", !58, !"_ZTS13HexxagonBoard", !63, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 57] [public] [init]
!72 = !{!"0x2e\00evaluate\00evaluate\00_ZN13HexxagonBoard8evaluateEv\0058\000\000\000\000\00259\000\0058", !58, !"_ZTS13HexxagonBoard", !73, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 58] [public] [evaluate]
!73 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !74, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!74 = !{!8, !65}
!75 = !{!"0x2e\00countBricks\00countBricks\00_ZN13HexxagonBoard11countBricksEi\0059\000\000\000\000\00259\000\0059", !58, !"_ZTS13HexxagonBoard", !76, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 59] [public] [countBricks]
!76 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !77, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!77 = !{!8, !65, !8}
!78 = !{!"0x2e\00getHexxagon\00getHexxagon\00_ZN13HexxagonBoard11getHexxagonEi\0060\000\000\000\000\00259\000\0060", !58, !"_ZTS13HexxagonBoard", !76, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 60] [public] [getHexxagon]
!79 = !{!"0x2e\00applyMove\00applyMove\00_ZN13HexxagonBoard9applyMoveER12HexxagonMove\0061\000\000\000\000\00259\000\0061", !58, !"_ZTS13HexxagonBoard", !80, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 61] [public] [applyMove]
!80 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !81, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!81 = !{!8, !65, !27}
!82 = !{!"0x2e\00generateMoveList\00generateMoveList\00_ZN13HexxagonBoard16generateMoveListEv\0063\000\000\000\000\00259\000\0063", !58, !"_ZTS13HexxagonBoard", !83, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 63] [public] [generateMoveList]
!83 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !84, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!84 = !{!85, !65}
!85 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS16HexxagonMoveList"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS16HexxagonMoveList]
!86 = !{!"0x2e\00computerMove\00computerMove\00_ZN13HexxagonBoard12computerMoveEiPFvvEi\0065\000\000\000\000\00259\000\0065", !58, !"_ZTS13HexxagonBoard", !87, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 65] [public] [computerMove]
!87 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !88, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!88 = !{!8, !65, !8, !31, !8}
!89 = !{!"0x2e\00endOfGame\00endOfGame\00_ZN13HexxagonBoard9endOfGameEv\0066\000\000\000\000\00259\000\0066", !58, !"_ZTS13HexxagonBoard", !73, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 66] [public] [endOfGame]
!90 = !{!"0x2e\00isMoveValid\00isMoveValid\00_ZN13HexxagonBoard11isMoveValidER12HexxagonMove\0067\000\000\000\000\00259\000\0067", !58, !"_ZTS13HexxagonBoard", !80, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 67] [public] [isMoveValid]
!91 = !{!"0x2e\00getBBBoard\00getBBBoard\00_ZN13HexxagonBoard10getBBBoardEv\0069\000\000\000\000\00259\000\0069", !58, !"_ZTS13HexxagonBoard", !92, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 69] [public] [getBBBoard]
!92 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !93, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!93 = !{!"_ZTS10BitBoard64", !65}
!94 = !{!"0x2e\00getBBColor\00getBBColor\00_ZN13HexxagonBoard10getBBColorEv\0070\000\000\000\000\00259\000\0070", !58, !"_ZTS13HexxagonBoard", !92, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 70] [public] [getBBColor]
!95 = !{!"0x2e\00operator=\00operator=\00_ZN13HexxagonBoardaSERKS_\0072\000\000\000\000\00259\000\0072", !58, !"_ZTS13HexxagonBoard", !96, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 72] [public] [operator=]
!96 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !97, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!97 = !{!"_ZTS13HexxagonBoard", !65, !69}
!98 = !{!"0x2e\00readFromFile\00readFromFile\00_ZN13HexxagonBoard12readFromFileEP8_IO_FILE\0074\000\000\000\000\00259\000\0074", !58, !"_ZTS13HexxagonBoard", !99, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 74] [public] [readFromFile]
!99 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !100, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!100 = !{!8, !65, !101}
!101 = !{!"0xf\00\000\0064\0064\000\000", null, null, !102} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!102 = !{!"0x16\00FILE\0048\000\000\000\000", !103, null, !"_ZTS8_IO_FILE"} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _ZTS8_IO_FILE]
!103 = !{!"/usr/include/stdio.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!104 = !{!"0x2e\00writeToFile\00writeToFile\00_ZN13HexxagonBoard11writeToFileEP8_IO_FILE\0075\000\000\000\000\00259\000\0075", !58, !"_ZTS13HexxagonBoard", !99, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 75] [public] [writeToFile]
!105 = !{!"0x2e\00displayBoardText\00displayBoardText\00_ZN13HexxagonBoard16displayBoardTextEi\0077\000\000\000\000\00259\000\0077", !58, !"_ZTS13HexxagonBoard", !106, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 77] [public] [displayBoardText]
!106 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !107, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!107 = !{null, !65, !8}
!108 = !{!"0x2\00BitBoard64\0031\0064\0032\000\000\000", !109, null, null, !110, null, null, !"_ZTS10BitBoard64"} ; [ DW_TAG_class_type ] [BitBoard64] [line 31, size 64, align 32, offset 0] [def] [from ]
!109 = !{!"./bitboard64.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!110 = !{!111, !115, !116, !120, !123, !126, !127, !130, !135, !136, !137, !138, !141, !145, !146, !149}
!111 = !{!"0xd\00lowbits\0056\0032\0032\000\000", !109, !"_ZTS10BitBoard64", !112} ; [ DW_TAG_member ] [lowbits] [line 56, size 32, align 32, offset 0] [from uint32_t]
!112 = !{!"0x16\00uint32_t\0051\000\000\000\000", !113, null, !114} ; [ DW_TAG_typedef ] [uint32_t] [line 51, size 0, align 0, offset 0] [from unsigned int]
!113 = !{!"/usr/include/stdint.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!114 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!115 = !{!"0xd\00highbits\0056\0032\0032\0032\000", !109, !"_ZTS10BitBoard64", !112} ; [ DW_TAG_member ] [highbits] [line 56, size 32, align 32, offset 32] [from uint32_t]
!116 = !{!"0x2e\00BitBoard64\00BitBoard64\00\0034\000\000\000\000\00259\000\0034", !109, !"_ZTS10BitBoard64", !117, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 34] [public] [BitBoard64]
!117 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !118, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!118 = !{null, !119}
!119 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS10BitBoard64"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS10BitBoard64]
!120 = !{!"0x2e\00BitBoard64\00BitBoard64\00\0035\000\000\000\000\00259\000\0035", !109, !"_ZTS10BitBoard64", !121, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 35] [public] [BitBoard64]
!121 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !122, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!122 = !{null, !119, !112, !112}
!123 = !{!"0x2e\00setBit\00setBit\00_ZN10BitBoard646setBitEi\0037\000\000\000\000\00259\000\0037", !109, !"_ZTS10BitBoard64", !124, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 37] [public] [setBit]
!124 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !125, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!125 = !{null, !119, !8}
!126 = !{!"0x2e\00unSetBit\00unSetBit\00_ZN10BitBoard648unSetBitEi\0038\000\000\000\000\00259\000\0038", !109, !"_ZTS10BitBoard64", !124, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 38] [public] [unSetBit]
!127 = !{!"0x2e\00getBit\00getBit\00_ZN10BitBoard646getBitEi\0039\000\000\000\000\00259\000\0039", !109, !"_ZTS10BitBoard64", !128, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 39] [public] [getBit]
!128 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !129, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!129 = !{!8, !119, !8}
!130 = !{!"0x2e\00operator&\00operator&\00_ZN10BitBoard64anERKS_\0041\000\000\000\000\00259\000\0041", !109, !"_ZTS10BitBoard64", !131, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 41] [public] [operator&]
!131 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !132, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!132 = !{!"_ZTS10BitBoard64", !119, !133}
!133 = !{!"0x10\00\000\000\000\000\000", null, null, !134} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!134 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS10BitBoard64"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS10BitBoard64]
!135 = !{!"0x2e\00operator|\00operator|\00_ZN10BitBoard64orERKS_\0042\000\000\000\000\00259\000\0042", !109, !"_ZTS10BitBoard64", !131, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 42] [public] [operator|]
!136 = !{!"0x2e\00operator^\00operator^\00_ZN10BitBoard64eoERKS_\0043\000\000\000\000\00259\000\0043", !109, !"_ZTS10BitBoard64", !131, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 43] [public] [operator^]
!137 = !{!"0x2e\00operator=\00operator=\00_ZN10BitBoard64aSERKS_\0044\000\000\000\000\00259\000\0044", !109, !"_ZTS10BitBoard64", !131, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 44] [public] [operator=]
!138 = !{!"0x2e\00operator~\00operator~\00_ZN10BitBoard64coEv\0045\000\000\000\000\00259\000\0045", !109, !"_ZTS10BitBoard64", !139, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 45] [public] [operator~]
!139 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !140, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!140 = !{!"_ZTS10BitBoard64", !119}
!141 = !{!"0x2e\00operator bool\00operator bool\00_ZN10BitBoard64cvbEv\0047\000\000\000\000\00259\000\0047", !109, !"_ZTS10BitBoard64", !142, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 47] [public] [operator bool]
!142 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !143, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!143 = !{!144, !119}
!144 = !{!"0x24\00bool\000\008\008\000\000\002", null, null} ; [ DW_TAG_base_type ] [bool] [line 0, size 8, align 8, offset 0, enc DW_ATE_boolean]
!145 = !{!"0x2e\00print\00print\00_ZN10BitBoard645printEv\0049\000\000\000\000\00259\000\0049", !109, !"_ZTS10BitBoard64", !117, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 49] [public] [print]
!146 = !{!"0x2e\00readFromFile\00readFromFile\00_ZN10BitBoard6412readFromFileEP8_IO_FILE\0051\000\000\000\000\00259\000\0051", !109, !"_ZTS10BitBoard64", !147, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 51] [public] [readFromFile]
!147 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !148, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!148 = !{!8, !119, !101}
!149 = !{!"0x2e\00writeToFile\00writeToFile\00_ZN10BitBoard6411writeToFileEP8_IO_FILE\0052\000\000\000\000\00259\000\0052", !109, !"_ZTS10BitBoard64", !147, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 52] [public] [writeToFile]
!150 = !{!"0x13\00_IO_FILE\00245\001728\0064\000\000\000", !151, null, null, !152, null, null, !"_ZTS8_IO_FILE"} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [def] [from ]
!151 = !{!"/usr/include/libio.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!152 = !{!153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !167, !169, !170, !171, !175, !177, !179, !183, !186, !188, !190, !191, !192, !193, !197, !198}
!153 = !{!"0xd\00_flags\00246\0032\0032\000\000", !151, !"_ZTS8_IO_FILE", !8} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!154 = !{!"0xd\00_IO_read_ptr\00251\0064\0064\0064\000", !151, !"_ZTS8_IO_FILE", !45} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!155 = !{!"0xd\00_IO_read_end\00252\0064\0064\00128\000", !151, !"_ZTS8_IO_FILE", !45} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!156 = !{!"0xd\00_IO_read_base\00253\0064\0064\00192\000", !151, !"_ZTS8_IO_FILE", !45} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!157 = !{!"0xd\00_IO_write_base\00254\0064\0064\00256\000", !151, !"_ZTS8_IO_FILE", !45} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!158 = !{!"0xd\00_IO_write_ptr\00255\0064\0064\00320\000", !151, !"_ZTS8_IO_FILE", !45} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!159 = !{!"0xd\00_IO_write_end\00256\0064\0064\00384\000", !151, !"_ZTS8_IO_FILE", !45} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!160 = !{!"0xd\00_IO_buf_base\00257\0064\0064\00448\000", !151, !"_ZTS8_IO_FILE", !45} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!161 = !{!"0xd\00_IO_buf_end\00258\0064\0064\00512\000", !151, !"_ZTS8_IO_FILE", !45} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!162 = !{!"0xd\00_IO_save_base\00260\0064\0064\00576\000", !151, !"_ZTS8_IO_FILE", !45} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!163 = !{!"0xd\00_IO_backup_base\00261\0064\0064\00640\000", !151, !"_ZTS8_IO_FILE", !45} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!164 = !{!"0xd\00_IO_save_end\00262\0064\0064\00704\000", !151, !"_ZTS8_IO_FILE", !45} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!165 = !{!"0xd\00_markers\00264\0064\0064\00768\000", !151, !"_ZTS8_IO_FILE", !166} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!166 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS10_IO_marker"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS10_IO_marker]
!167 = !{!"0xd\00_chain\00266\0064\0064\00832\000", !151, !"_ZTS8_IO_FILE", !168} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!168 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS8_IO_FILE"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS8_IO_FILE]
!169 = !{!"0xd\00_fileno\00268\0032\0032\00896\000", !151, !"_ZTS8_IO_FILE", !8} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!170 = !{!"0xd\00_flags2\00272\0032\0032\00928\000", !151, !"_ZTS8_IO_FILE", !8} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!171 = !{!"0xd\00_old_offset\00274\0064\0064\00960\000", !151, !"_ZTS8_IO_FILE", !172} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!172 = !{!"0x16\00__off_t\00131\000\000\000\000", !173, null, !174} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!173 = !{!"/usr/include/x86_64-linux-gnu/bits/types.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!174 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!175 = !{!"0xd\00_cur_column\00278\0016\0016\001024\000", !151, !"_ZTS8_IO_FILE", !176} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!176 = !{!"0x24\00unsigned short\000\0016\0016\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!177 = !{!"0xd\00_vtable_offset\00279\008\008\001040\000", !151, !"_ZTS8_IO_FILE", !178} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!178 = !{!"0x24\00signed char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [signed char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!179 = !{!"0xd\00_shortbuf\00280\008\008\001048\000", !151, !"_ZTS8_IO_FILE", !180} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!180 = !{!"0x1\00\000\008\008\000\000\000", null, null, !46, !181, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from char]
!181 = !{!182}
!182 = !{!"0x21\000\001"}                         ; [ DW_TAG_subrange_type ] [0, 0]
!183 = !{!"0xd\00_lock\00284\0064\0064\001088\000", !151, !"_ZTS8_IO_FILE", !184} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!184 = !{!"0xf\00\000\0064\0064\000\000", null, null, !185} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_lock_t]
!185 = !{!"0x16\00_IO_lock_t\00154\000\000\000\000", !151, null, null} ; [ DW_TAG_typedef ] [_IO_lock_t] [line 154, size 0, align 0, offset 0] [from ]
!186 = !{!"0xd\00_offset\00293\0064\0064\001152\000", !151, !"_ZTS8_IO_FILE", !187} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!187 = !{!"0x16\00__off64_t\00132\000\000\000\000", !173, null, !174} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!188 = !{!"0xd\00__pad1\00302\0064\0064\001216\000", !151, !"_ZTS8_IO_FILE", !189} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!189 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!190 = !{!"0xd\00__pad2\00303\0064\0064\001280\000", !151, !"_ZTS8_IO_FILE", !189} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!191 = !{!"0xd\00__pad3\00304\0064\0064\001344\000", !151, !"_ZTS8_IO_FILE", !189} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!192 = !{!"0xd\00__pad4\00305\0064\0064\001408\000", !151, !"_ZTS8_IO_FILE", !189} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!193 = !{!"0xd\00__pad5\00306\0064\0064\001472\000", !151, !"_ZTS8_IO_FILE", !194} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!194 = !{!"0x16\00size_t\0062\000\000\000\000", !195, null, !196} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!195 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!196 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!197 = !{!"0xd\00_mode\00308\0032\0032\001536\000", !151, !"_ZTS8_IO_FILE", !8} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!198 = !{!"0xd\00_unused2\00310\00160\008\001568\000", !151, !"_ZTS8_IO_FILE", !199} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!199 = !{!"0x1\00\000\00160\008\000\000\000", null, null, !46, !200, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 160, align 8, offset 0] [from char]
!200 = !{!201}
!201 = !{!"0x21\000\0020"}                        ; [ DW_TAG_subrange_type ] [0, 19]
!202 = !{!"0x2\00HexxagonMove\0028\000\000\000\004\000", !58, null, null, null, null, null, !"_ZTS12HexxagonMove"} ; [ DW_TAG_class_type ] [HexxagonMove] [line 28, size 0, align 0, offset 0] [decl] [from ]
!203 = !{!"0x2\00HexxagonMoveList\0029\000\000\000\004\000", !58, null, null, null, null, null, !"_ZTS16HexxagonMoveList"} ; [ DW_TAG_class_type ] [HexxagonMoveList] [line 29, size 0, align 0, offset 0] [decl] [from ]
!204 = !{!"0x13\00_IO_marker\00160\000\000\000\004\000", !151, null, null, null, null, null, !"_ZTS10_IO_marker"} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 0, align 0, offset 0] [decl] [from ]
!205 = !{!206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218}
!206 = !{!"0x2e\00HexxagonGame\00HexxagonGame\00_ZN12HexxagonGameC2Ev\0030\000\001\000\000\00256\000\0031", !1, !"_ZTS12HexxagonGame", !13, null, void (%class.HexxagonGame*)* @_ZN12HexxagonGameC2Ev, null, !12, !2} ; [ DW_TAG_subprogram ] [line 30] [def] [scope 31] [HexxagonGame]
!207 = !{!"0x2e\00next\00next\00_ZN12HexxagonGame4nextEv\0048\000\001\000\000\00256\000\0049", !1, !"_ZTS12HexxagonGame", !18, null, i32 (%class.HexxagonGame*)* @_ZN12HexxagonGame4nextEv, null, !20, !2} ; [ DW_TAG_subprogram ] [line 48] [def] [scope 49] [next]
!208 = !{!"0x2e\00prev\00prev\00_ZN12HexxagonGame4prevEv\0060\000\001\000\000\00256\000\0061", !1, !"_ZTS12HexxagonGame", !18, null, i32 (%class.HexxagonGame*)* @_ZN12HexxagonGame4prevEv, null, !21, !2} ; [ DW_TAG_subprogram ] [line 60] [def] [scope 61] [prev]
!209 = !{!"0x2e\00reset\00reset\00_ZN12HexxagonGame5resetEv\0072\000\001\000\000\00256\000\0073", !1, !"_ZTS12HexxagonGame", !13, null, void (%class.HexxagonGame*)* @_ZN12HexxagonGame5resetEv, null, !22, !2} ; [ DW_TAG_subprogram ] [line 72] [def] [scope 73] [reset]
!210 = !{!"0x2e\00destroyRest\00destroyRest\00_ZN12HexxagonGame11destroyRestEv\0080\000\001\000\000\00256\000\0081", !1, !"_ZTS12HexxagonGame", !13, null, void (%class.HexxagonGame*)* @_ZN12HexxagonGame11destroyRestEv, null, !23, !2} ; [ DW_TAG_subprogram ] [line 80] [def] [scope 81] [destroyRest]
!211 = !{!"0x2e\00applyMove\00applyMove\00_ZN12HexxagonGame9applyMoveER12HexxagonMove\0094\000\001\000\000\00256\000\0095", !1, !"_ZTS12HexxagonGame", !25, null, i32 (%class.HexxagonGame*, %class.HexxagonMove*)* @_ZN12HexxagonGame9applyMoveER12HexxagonMove, null, !24, !2} ; [ DW_TAG_subprogram ] [line 94] [def] [scope 95] [applyMove]
!212 = !{!"0x2e\00computerMove\00computerMove\00_ZN12HexxagonGame12computerMoveEiPFvvEi\00113\000\001\000\000\00256\000\00114", !1, !"_ZTS12HexxagonGame", !29, null, i32 (%class.HexxagonGame*, i32, void ()*, i32)* @_ZN12HexxagonGame12computerMoveEiPFvvEi, null, !28, !2} ; [ DW_TAG_subprogram ] [line 113] [def] [scope 114] [computerMove]
!213 = !{!"0x2e\00noBoards\00noBoards\00_ZN12HexxagonGame8noBoardsEv\00140\000\001\000\000\00256\000\00141", !1, !"_ZTS12HexxagonGame", !18, null, i32 (%class.HexxagonGame*)* @_ZN12HexxagonGame8noBoardsEv, null, !34, !2} ; [ DW_TAG_subprogram ] [line 140] [def] [scope 141] [noBoards]
!214 = !{!"0x2e\00loadGame\00loadGame\00_ZN12HexxagonGame8loadGameEPc\00156\000\001\000\000\00256\000\00157", !1, !"_ZTS12HexxagonGame", !43, null, i32 (%class.HexxagonGame*, i8*)* @_ZN12HexxagonGame8loadGameEPc, null, !47, !2} ; [ DW_TAG_subprogram ] [line 156] [def] [scope 157] [loadGame]
!215 = !{!"0x2e\00saveGame\00saveGame\00_ZN12HexxagonGame8saveGameEPc\00228\000\001\000\000\00256\000\00229", !1, !"_ZTS12HexxagonGame", !43, null, i32 (%class.HexxagonGame*, i8*)* @_ZN12HexxagonGame8saveGameEPc, null, !42, !2} ; [ DW_TAG_subprogram ] [line 228] [def] [scope 229] [saveGame]
!216 = !{!"0x2e\00GameList\00GameList\00_ZN8GameListC2EPS_\0031\000\001\000\000\00256\000\0031", !5, !"_ZTS8GameList", !54, null, void (%class.GameList*, %class.GameList*)* @_ZN8GameListC2EPS_, null, !53, !2} ; [ DW_TAG_subprogram ] [line 31] [def] [GameList]
!217 = !{!"0x2e\00HexxagonBoard\00HexxagonBoard\00_ZN13HexxagonBoardC2Ev\0054\000\001\000\000\00256\000\0054", !58, !"_ZTS13HexxagonBoard", !63, null, void (%class.HexxagonBoard*)* @_ZN13HexxagonBoardC2Ev, null, !62, !2} ; [ DW_TAG_subprogram ] [line 54] [def] [HexxagonBoard]
!218 = !{!"0x2e\00BitBoard64\00BitBoard64\00_ZN10BitBoard64C2Ev\0034\000\001\000\000\00256\000\0034", !109, !"_ZTS10BitBoard64", !117, null, void (%class.BitBoard64*)* @_ZN10BitBoard64C2Ev, null, !116, !2} ; [ DW_TAG_subprogram ] [line 34] [def] [BitBoard64]
!219 = !{i32 2, !"Dwarf Version", i32 4}
!220 = !{i32 2, !"Debug Info Version", i32 2}
!221 = !{!"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp", !0}
!222 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!223 = !{!"0x101\00this\0016777216\001088", !206, null, !224} ; [ DW_TAG_arg_variable ] [this] [line 0]
!224 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS12HexxagonGame"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS12HexxagonGame]
!225 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!226 = !MDLocation(line: 0, scope: !206)
!227 = !MDLocation(line: 32, column: 6, scope: !228)
!228 = !{!"0xb\0032\005\001", !1, !229}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!229 = !{!"0xb\0031\001\000", !1, !206}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!230 = !MDLocation(line: 32, column: 5, scope: !229)
!231 = !MDLocation(line: 33, column: 3, scope: !228)
!232 = !MDLocation(line: 35, column: 6, scope: !233)
!233 = !{!"0xb\0035\005\002", !1, !229}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!234 = !MDLocation(line: 35, column: 5, scope: !229)
!235 = !MDLocation(line: 36, column: 3, scope: !233)
!236 = !MDLocation(line: 38, column: 12, scope: !229)
!237 = !{!"0x100\00tmp\0038\000", !229, !238, !10} ; [ DW_TAG_auto_variable ] [tmp] [line 38]
!238 = !{!"0x29", !1}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!239 = !MDLocation(line: 38, column: 18, scope: !229)
!240 = !MDLocation(line: 38, column: 12, scope: !241)
!241 = !{!"0xb\001", !1, !229}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!242 = !MDLocation(line: 40, column: 2, scope: !229)
!243 = !MDLocation(line: 42, column: 10, scope: !229)
!244 = !MDLocation(line: 42, column: 2, scope: !229)
!245 = !MDLocation(line: 43, column: 9, scope: !229)
!246 = !MDLocation(line: 43, column: 2, scope: !229)
!247 = !MDLocation(line: 45, column: 2, scope: !229)
!248 = !MDLocation(line: 46, column: 1, scope: !206)
!249 = !MDLocation(line: 46, column: 1, scope: !229)
!250 = !MDLocation(line: 46, column: 1, scope: !241)
!251 = !{!"0x101\00this\0016777216\001088", !216, null, !10} ; [ DW_TAG_arg_variable ] [this] [line 0]
!252 = !MDLocation(line: 0, scope: !216)
!253 = !{!"0x101\00p\0033554463\000", !216, !254, !10} ; [ DW_TAG_arg_variable ] [p] [line 31]
!254 = !{!"0x29", !5}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagongame.h]
!255 = !MDLocation(line: 31, column: 21, scope: !216)
!256 = !MDLocation(line: 31, column: 24, scope: !216)
!257 = !MDLocation(line: 31, column: 32, scope: !258)
!258 = !{!"0xb\0031\0024\0034", !5, !216}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagongame.h]
!259 = !MDLocation(line: 31, column: 25, scope: !258)
!260 = !MDLocation(line: 31, column: 35, scope: !258)
!261 = !MDLocation(line: 31, column: 44, scope: !216)
!262 = !{!"0x101\00this\0016777216\001088", !207, null, !224} ; [ DW_TAG_arg_variable ] [this] [line 0]
!263 = !MDLocation(line: 0, scope: !207)
!264 = !MDLocation(line: 50, column: 5, scope: !265)
!265 = !{!"0xb\0050\005\003", !1, !207}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!266 = !MDLocation(line: 50, column: 5, scope: !207)
!267 = !MDLocation(line: 52, column: 11, scope: !268)
!268 = !{!"0xb\0051\002\004", !1, !265}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!269 = !MDLocation(line: 52, column: 10, scope: !268)
!270 = !MDLocation(line: 52, column: 3, scope: !268)
!271 = !MDLocation(line: 53, column: 10, scope: !268)
!272 = !MDLocation(line: 53, column: 3, scope: !268)
!273 = !MDLocation(line: 54, column: 3, scope: !268)
!274 = !MDLocation(line: 57, column: 2, scope: !207)
!275 = !MDLocation(line: 58, column: 1, scope: !207)
!276 = !{!"0x101\00this\0016777216\001088", !208, null, !224} ; [ DW_TAG_arg_variable ] [this] [line 0]
!277 = !MDLocation(line: 0, scope: !208)
!278 = !MDLocation(line: 62, column: 5, scope: !279)
!279 = !{!"0xb\0062\005\005", !1, !208}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!280 = !MDLocation(line: 62, column: 5, scope: !208)
!281 = !MDLocation(line: 64, column: 11, scope: !282)
!282 = !{!"0xb\0063\002\006", !1, !279}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!283 = !MDLocation(line: 64, column: 10, scope: !282)
!284 = !MDLocation(line: 64, column: 3, scope: !282)
!285 = !MDLocation(line: 65, column: 10, scope: !282)
!286 = !MDLocation(line: 65, column: 3, scope: !282)
!287 = !MDLocation(line: 66, column: 3, scope: !282)
!288 = !MDLocation(line: 69, column: 2, scope: !208)
!289 = !MDLocation(line: 70, column: 1, scope: !208)
!290 = !{!"0x101\00this\0016777216\001088", !209, null, !224} ; [ DW_TAG_arg_variable ] [this] [line 0]
!291 = !MDLocation(line: 0, scope: !209)
!292 = !MDLocation(line: 74, column: 2, scope: !209)
!293 = !MDLocation(line: 74, column: 9, scope: !294)
!294 = !{!"0xb\003", !1, !295}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!295 = !{!"0xb\001", !1, !209}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!296 = !MDLocation(line: 74, column: 8, scope: !209)
!297 = !MDLocation(line: 74, column: 2, scope: !298)
!298 = !{!"0xb\002", !1, !209}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!299 = !MDLocation(line: 77, column: 2, scope: !209)
!300 = !MDLocation(line: 78, column: 1, scope: !209)
!301 = !{!"0x101\00this\0016777216\001088", !210, null, !224} ; [ DW_TAG_arg_variable ] [this] [line 0]
!302 = !MDLocation(line: 0, scope: !210)
!303 = !{!"0x100\00step\0082\000", !210, !238, !10} ; [ DW_TAG_auto_variable ] [step] [line 82]
!304 = !MDLocation(line: 82, column: 12, scope: !210)
!305 = !MDLocation(line: 82, column: 19, scope: !210)
!306 = !MDLocation(line: 84, column: 2, scope: !210)
!307 = !MDLocation(line: 84, column: 8, scope: !308)
!308 = !{!"0xb\002", !1, !309}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!309 = !{!"0xb\001", !1, !210}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!310 = !{!"0x100\00tmp\0086\000", !311, !238, !10} ; [ DW_TAG_auto_variable ] [tmp] [line 86]
!311 = !{!"0xb\0085\002\007", !1, !210}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!312 = !MDLocation(line: 86, column: 13, scope: !311)
!313 = !MDLocation(line: 86, column: 19, scope: !311)
!314 = !MDLocation(line: 87, column: 10, scope: !311)
!315 = !MDLocation(line: 87, column: 3, scope: !311)
!316 = !MDLocation(line: 87, column: 3, scope: !317)
!317 = !{!"0xb\001", !1, !311}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!318 = !MDLocation(line: 88, column: 10, scope: !311)
!319 = !MDLocation(line: 88, column: 3, scope: !311)
!320 = !MDLocation(line: 91, column: 2, scope: !210)
!321 = !MDLocation(line: 92, column: 1, scope: !210)
!322 = !{!"0x101\00this\0016777216\001088", !211, null, !224} ; [ DW_TAG_arg_variable ] [this] [line 0]
!323 = !MDLocation(line: 0, scope: !211)
!324 = !{!"0x101\00move\0033554526\000", !211, !238, !27} ; [ DW_TAG_arg_variable ] [move] [line 94]
!325 = !MDLocation(line: 94, column: 43, scope: !211)
!326 = !{!"0x100\00tmp\0096\000", !211, !238, !10} ; [ DW_TAG_auto_variable ] [tmp] [line 96]
!327 = !MDLocation(line: 96, column: 12, scope: !211)
!328 = !MDLocation(line: 96, column: 18, scope: !211)
!329 = !MDLocation(line: 96, column: 31, scope: !211)
!330 = !MDLocation(line: 96, column: 12, scope: !331)
!331 = !{!"0xb\001", !1, !211}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!332 = !MDLocation(line: 98, column: 2, scope: !211)
!333 = !MDLocation(line: 98, column: 33, scope: !211)
!334 = !{!"0x100\00ret\00100\000", !211, !238, !8} ; [ DW_TAG_auto_variable ] [ret] [line 100]
!335 = !MDLocation(line: 100, column: 6, scope: !211)
!336 = !MDLocation(line: 100, column: 12, scope: !211)
!337 = !MDLocation(line: 102, column: 6, scope: !338)
!338 = !{!"0xb\00102\005\008", !1, !211}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!339 = !MDLocation(line: 102, column: 5, scope: !211)
!340 = !MDLocation(line: 104, column: 16, scope: !341)
!341 = !{!"0xb\00103\002\009", !1, !338}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!342 = !MDLocation(line: 104, column: 3, scope: !341)
!343 = !MDLocation(line: 105, column: 3, scope: !341)
!344 = !MDLocation(line: 106, column: 2, scope: !341)
!345 = !MDLocation(line: 111, column: 1, scope: !211)
!346 = !MDLocation(line: 108, column: 10, scope: !338)
!347 = !MDLocation(line: 108, column: 3, scope: !338)
!348 = !MDLocation(line: 108, column: 3, scope: !349)
!349 = !{!"0xb\001", !1, !338}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!350 = !MDLocation(line: 110, column: 9, scope: !211)
!351 = !MDLocation(line: 110, column: 2, scope: !211)
!352 = !MDLocation(line: 111, column: 1, scope: !331)
!353 = !{!"0x101\00this\0016777216\001088", !212, null, !224} ; [ DW_TAG_arg_variable ] [this] [line 0]
!354 = !MDLocation(line: 0, scope: !212)
!355 = !{!"0x101\00depth\0033554545\000", !212, !238, !8} ; [ DW_TAG_arg_variable ] [depth] [line 113]
!356 = !MDLocation(line: 113, column: 36, scope: !212)
!357 = !{!"0x101\00callback\0050331761\000", !212, !238, !31} ; [ DW_TAG_arg_variable ] [callback] [line 113]
!358 = !MDLocation(line: 113, column: 50, scope: !212)
!359 = !{!"0x101\00maxtime\0067108977\000", !212, !238, !8} ; [ DW_TAG_arg_variable ] [maxtime] [line 113]
!360 = !MDLocation(line: 113, column: 67, scope: !212)
!361 = !{!"0x100\00tmp\00115\000", !212, !238, !10} ; [ DW_TAG_auto_variable ] [tmp] [line 115]
!362 = !MDLocation(line: 115, column: 12, scope: !212)
!363 = !MDLocation(line: 115, column: 18, scope: !212)
!364 = !MDLocation(line: 115, column: 31, scope: !212)
!365 = !MDLocation(line: 115, column: 12, scope: !366)
!366 = !{!"0xb\001", !1, !212}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!367 = !MDLocation(line: 117, column: 2, scope: !212)
!368 = !MDLocation(line: 117, column: 33, scope: !212)
!369 = !{!"0x100\00ret\00119\000", !212, !238, !8} ; [ DW_TAG_auto_variable ] [ret] [line 119]
!370 = !MDLocation(line: 119, column: 6, scope: !212)
!371 = !MDLocation(line: 119, column: 12, scope: !212)
!372 = !MDLocation(line: 119, column: 30, scope: !212)
!373 = !MDLocation(line: 119, column: 37, scope: !212)
!374 = !MDLocation(line: 119, column: 47, scope: !212)
!375 = !MDLocation(line: 121, column: 6, scope: !376)
!376 = !{!"0xb\00121\005\0010", !1, !212}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!377 = !MDLocation(line: 121, column: 5, scope: !212)
!378 = !MDLocation(line: 123, column: 16, scope: !379)
!379 = !{!"0xb\00122\002\0011", !1, !376}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!380 = !MDLocation(line: 123, column: 3, scope: !379)
!381 = !MDLocation(line: 124, column: 3, scope: !379)
!382 = !MDLocation(line: 125, column: 2, scope: !379)
!383 = !MDLocation(line: 130, column: 1, scope: !212)
!384 = !MDLocation(line: 127, column: 10, scope: !376)
!385 = !MDLocation(line: 127, column: 3, scope: !376)
!386 = !MDLocation(line: 127, column: 3, scope: !387)
!387 = !{!"0xb\001", !1, !376}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!388 = !MDLocation(line: 129, column: 9, scope: !212)
!389 = !MDLocation(line: 129, column: 2, scope: !212)
!390 = !MDLocation(line: 130, column: 1, scope: !366)
!391 = !{!"0x101\00this\0016777216\001088", !213, null, !224} ; [ DW_TAG_arg_variable ] [this] [line 0]
!392 = !MDLocation(line: 0, scope: !213)
!393 = !{!"0x100\00step\00142\000", !213, !238, !10} ; [ DW_TAG_auto_variable ] [step] [line 142]
!394 = !MDLocation(line: 142, column: 12, scope: !213)
!395 = !MDLocation(line: 142, column: 19, scope: !213)
!396 = !{!"0x100\00sum\00143\000", !213, !238, !8} ; [ DW_TAG_auto_variable ] [sum] [line 143]
!397 = !MDLocation(line: 143, column: 6, scope: !213)
!398 = !MDLocation(line: 145, column: 2, scope: !213)
!399 = !MDLocation(line: 145, column: 8, scope: !400)
!400 = !{!"0xb\002", !1, !401}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!401 = !{!"0xb\001", !1, !213}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!402 = !MDLocation(line: 147, column: 3, scope: !403)
!403 = !{!"0xb\00146\002\0012", !1, !213}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!404 = !MDLocation(line: 148, column: 10, scope: !403)
!405 = !MDLocation(line: 148, column: 3, scope: !403)
!406 = !MDLocation(line: 151, column: 9, scope: !213)
!407 = !MDLocation(line: 151, column: 2, scope: !213)
!408 = !{!"0x101\00this\0016777216\001088", !214, null, !224} ; [ DW_TAG_arg_variable ] [this] [line 0]
!409 = !MDLocation(line: 0, scope: !214)
!410 = !{!"0x101\00filename\0033554588\000", !214, !238, !45} ; [ DW_TAG_arg_variable ] [filename] [line 156]
!411 = !MDLocation(line: 156, column: 34, scope: !214)
!412 = !{!"0x100\00loadfile\00158\000", !214, !238, !101} ; [ DW_TAG_auto_variable ] [loadfile] [line 158]
!413 = !MDLocation(line: 158, column: 8, scope: !214)
!414 = !MDLocation(line: 160, column: 19, scope: !214)
!415 = !MDLocation(line: 160, column: 13, scope: !214)
!416 = !MDLocation(line: 160, column: 2, scope: !214)
!417 = !MDLocation(line: 162, column: 6, scope: !418)
!418 = !{!"0xb\00162\005\0013", !1, !214}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!419 = !MDLocation(line: 162, column: 5, scope: !214)
!420 = !MDLocation(line: 163, column: 3, scope: !418)
!421 = !{!"0x100\00str\00165\000", !214, !238, !422} ; [ DW_TAG_auto_variable ] [str] [line 165]
!422 = !{!"0x1\00\000\00512\008\000\000\000", null, null, !46, !423, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 512, align 8, offset 0] [from char]
!423 = !{!424}
!424 = !{!"0x21\000\0064"}                        ; [ DW_TAG_subrange_type ] [0, 63]
!425 = !MDLocation(line: 165, column: 7, scope: !214)
!426 = !MDLocation(line: 166, column: 11, scope: !427)
!427 = !{!"0xb\00166\005\0014", !1, !214}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!428 = !MDLocation(line: 166, column: 37, scope: !427)
!429 = !MDLocation(line: 166, column: 5, scope: !427)
!430 = !MDLocation(line: 166, column: 5, scope: !214)
!431 = !MDLocation(line: 168, column: 11, scope: !432)
!432 = !{!"0xb\00167\002\0015", !1, !427}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!433 = !MDLocation(line: 168, column: 4, scope: !432)
!434 = !MDLocation(line: 169, column: 4, scope: !432)
!435 = !MDLocation(line: 172, column: 12, scope: !436)
!436 = !{!"0xb\00172\005\0016", !1, !214}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!437 = !MDLocation(line: 172, column: 5, scope: !436)
!438 = !MDLocation(line: 172, column: 5, scope: !214)
!439 = !MDLocation(line: 174, column: 11, scope: !440)
!440 = !{!"0xb\00173\002\0017", !1, !436}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!441 = !MDLocation(line: 174, column: 4, scope: !440)
!442 = !MDLocation(line: 175, column: 4, scope: !440)
!443 = !{!"0x100\00no\00178\000", !214, !238, !174} ; [ DW_TAG_auto_variable ] [no] [line 178]
!444 = !MDLocation(line: 178, column: 11, scope: !214)
!445 = !MDLocation(line: 179, column: 11, scope: !446)
!446 = !{!"0xb\00179\005\0018", !1, !214}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!447 = !MDLocation(line: 179, column: 37, scope: !446)
!448 = !MDLocation(line: 179, column: 5, scope: !446)
!449 = !MDLocation(line: 179, column: 5, scope: !214)
!450 = !MDLocation(line: 181, column: 11, scope: !451)
!451 = !{!"0xb\00180\002\0019", !1, !446}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!452 = !MDLocation(line: 181, column: 4, scope: !451)
!453 = !MDLocation(line: 182, column: 4, scope: !451)
!454 = !MDLocation(line: 185, column: 13, scope: !214)
!455 = !MDLocation(line: 185, column: 7, scope: !214)
!456 = !MDLocation(line: 185, column: 2, scope: !214)
!457 = !MDLocation(line: 187, column: 9, scope: !214)
!458 = !MDLocation(line: 187, column: 2, scope: !214)
!459 = !MDLocation(line: 188, column: 2, scope: !214)
!460 = !MDLocation(line: 189, column: 9, scope: !214)
!461 = !MDLocation(line: 189, column: 2, scope: !214)
!462 = !MDLocation(line: 189, column: 2, scope: !463)
!463 = !{!"0xb\001", !1, !214}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!464 = !MDLocation(line: 190, column: 2, scope: !214)
!465 = !MDLocation(line: 191, column: 2, scope: !214)
!466 = !MDLocation(line: 192, column: 2, scope: !214)
!467 = !MDLocation(line: 192, column: 8, scope: !468)
!468 = !{!"0xb\002", !1, !463}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!469 = !{!"0x100\00tmp\00194\000", !470, !238, !10} ; [ DW_TAG_auto_variable ] [tmp] [line 194]
!470 = !{!"0xb\00193\002\0020", !1, !214}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!471 = !MDLocation(line: 194, column: 13, scope: !470)
!472 = !MDLocation(line: 196, column: 6, scope: !473)
!473 = !{!"0xb\00196\006\0021", !1, !470}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!474 = !MDLocation(line: 196, column: 6, scope: !470)
!475 = !MDLocation(line: 198, column: 10, scope: !476)
!476 = !{!"0xb\00197\003\0022", !1, !473}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!477 = !MDLocation(line: 198, column: 4, scope: !478)
!478 = !{!"0xb\001", !1, !476}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!479 = !MDLocation(line: 200, column: 12, scope: !476)
!480 = !MDLocation(line: 200, column: 4, scope: !476)
!481 = !MDLocation(line: 201, column: 11, scope: !476)
!482 = !MDLocation(line: 201, column: 4, scope: !476)
!483 = !MDLocation(line: 202, column: 3, scope: !476)
!484 = !MDLocation(line: 226, column: 1, scope: !476)
!485 = !MDLocation(line: 205, column: 10, scope: !486)
!486 = !{!"0xb\00204\003\0023", !1, !473}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!487 = !MDLocation(line: 205, column: 23, scope: !486)
!488 = !MDLocation(line: 205, column: 4, scope: !489)
!489 = !{!"0xb\001", !1, !486}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!490 = !MDLocation(line: 206, column: 17, scope: !486)
!491 = !MDLocation(line: 206, column: 4, scope: !486)
!492 = !MDLocation(line: 208, column: 4, scope: !486)
!493 = !MDLocation(line: 226, column: 1, scope: !486)
!494 = !{!"0x100\00ret\00211\000", !470, !238, !8} ; [ DW_TAG_auto_variable ] [ret] [line 211]
!495 = !MDLocation(line: 211, column: 7, scope: !470)
!496 = !MDLocation(line: 211, column: 13, scope: !470)
!497 = !MDLocation(line: 211, column: 31, scope: !470)
!498 = !MDLocation(line: 213, column: 6, scope: !499)
!499 = !{!"0xb\00213\006\0024", !1, !470}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!500 = !MDLocation(line: 213, column: 6, scope: !470)
!501 = !MDLocation(line: 215, column: 4, scope: !502)
!502 = !{!"0xb\00214\003\0025", !1, !499}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!503 = !MDLocation(line: 216, column: 4, scope: !502)
!504 = !MDLocation(line: 217, column: 11, scope: !502)
!505 = !MDLocation(line: 217, column: 4, scope: !502)
!506 = !MDLocation(line: 220, column: 3, scope: !470)
!507 = !MDLocation(line: 223, column: 9, scope: !214)
!508 = !MDLocation(line: 223, column: 2, scope: !214)
!509 = !MDLocation(line: 225, column: 2, scope: !214)
!510 = !MDLocation(line: 226, column: 1, scope: !214)
!511 = !MDLocation(line: 226, column: 1, scope: !512)
!512 = !{!"0xb\002", !1, !478}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!513 = !{!"0x101\00this\0016777216\001088", !215, null, !224} ; [ DW_TAG_arg_variable ] [this] [line 0]
!514 = !MDLocation(line: 0, scope: !215)
!515 = !{!"0x101\00filename\0033554660\000", !215, !238, !45} ; [ DW_TAG_arg_variable ] [filename] [line 228]
!516 = !MDLocation(line: 228, column: 34, scope: !215)
!517 = !{!"0x100\00savefile\00230\000", !215, !238, !101} ; [ DW_TAG_auto_variable ] [savefile] [line 230]
!518 = !MDLocation(line: 230, column: 8, scope: !215)
!519 = !MDLocation(line: 232, column: 19, scope: !215)
!520 = !MDLocation(line: 232, column: 13, scope: !215)
!521 = !MDLocation(line: 232, column: 2, scope: !215)
!522 = !MDLocation(line: 234, column: 6, scope: !523)
!523 = !{!"0xb\00234\005\0026", !1, !215}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!524 = !MDLocation(line: 234, column: 5, scope: !215)
!525 = !MDLocation(line: 235, column: 3, scope: !523)
!526 = !MDLocation(line: 237, column: 43, scope: !527)
!527 = !{!"0xb\00237\005\0027", !1, !215}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!528 = !MDLocation(line: 237, column: 5, scope: !527)
!529 = !MDLocation(line: 237, column: 5, scope: !215)
!530 = !MDLocation(line: 239, column: 11, scope: !531)
!531 = !{!"0xb\00238\002\0028", !1, !527}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!532 = !MDLocation(line: 239, column: 4, scope: !531)
!533 = !MDLocation(line: 240, column: 4, scope: !531)
!534 = !{!"0x100\00no\00243\000", !215, !238, !174} ; [ DW_TAG_auto_variable ] [no] [line 243]
!535 = !MDLocation(line: 243, column: 11, scope: !215)
!536 = !MDLocation(line: 245, column: 13, scope: !215)
!537 = !MDLocation(line: 245, column: 7, scope: !215)
!538 = !MDLocation(line: 245, column: 2, scope: !215)
!539 = !MDLocation(line: 248, column: 12, scope: !540)
!540 = !{!"0xb\00248\005\0029", !1, !215}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!541 = !MDLocation(line: 248, column: 38, scope: !540)
!542 = !MDLocation(line: 248, column: 5, scope: !540)
!543 = !MDLocation(line: 248, column: 5, scope: !215)
!544 = !MDLocation(line: 250, column: 11, scope: !545)
!545 = !{!"0xb\00249\002\0030", !1, !540}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!546 = !MDLocation(line: 250, column: 4, scope: !545)
!547 = !MDLocation(line: 251, column: 4, scope: !545)
!548 = !MDLocation(line: 254, column: 12, scope: !215)
!549 = !{!"0x100\00step\00254\000", !215, !238, !10} ; [ DW_TAG_auto_variable ] [step] [line 254]
!550 = !MDLocation(line: 254, column: 19, scope: !215)
!551 = !MDLocation(line: 255, column: 2, scope: !215)
!552 = !MDLocation(line: 255, column: 8, scope: !553)
!553 = !{!"0xb\002", !1, !554}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!554 = !{!"0xb\001", !1, !215}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!555 = !MDLocation(line: 257, column: 6, scope: !556)
!556 = !{!"0xb\00257\006\0032", !1, !557}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!557 = !{!"0xb\00256\002\0031", !1, !215}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!558 = !MDLocation(line: 257, column: 24, scope: !556)
!559 = !MDLocation(line: 257, column: 6, scope: !557)
!560 = !MDLocation(line: 259, column: 12, scope: !561)
!561 = !{!"0xb\00258\003\0033", !1, !556}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagongame.cpp]
!562 = !MDLocation(line: 259, column: 5, scope: !561)
!563 = !MDLocation(line: 260, column: 5, scope: !561)
!564 = !MDLocation(line: 263, column: 10, scope: !557)
!565 = !MDLocation(line: 263, column: 3, scope: !557)
!566 = !MDLocation(line: 266, column: 9, scope: !215)
!567 = !MDLocation(line: 266, column: 2, scope: !215)
!568 = !MDLocation(line: 268, column: 2, scope: !215)
!569 = !MDLocation(line: 269, column: 1, scope: !215)
!570 = !{!"0x101\00this\0016777216\001088", !217, null, !38} ; [ DW_TAG_arg_variable ] [this] [line 0]
!571 = !MDLocation(line: 0, scope: !217)
!572 = !MDLocation(line: 54, column: 2, scope: !217)
!573 = !MDLocation(line: 54, column: 23, scope: !217)
!574 = !{!"0x101\00this\0016777216\001088", !218, null, !575} ; [ DW_TAG_arg_variable ] [this] [line 0]
!575 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS10BitBoard64"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS10BitBoard64]
!576 = !MDLocation(line: 0, scope: !218)
!577 = !MDLocation(line: 34, column: 20, scope: !218)
