; ModuleID = 'hexxagon.cpp'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%class.HexxagonGame = type { i32, %class.GameList*, %class.GameList* }
%class.GameList = type { %class.HexxagonBoard, %class.GameList*, %class.GameList* }
%class.HexxagonBoard = type { %class.BitBoard64, %class.BitBoard64 }
%class.BitBoard64 = type { i32, i32 }
%class.HexxagonMove = type { i8, i8, i32 }

@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"Hexxagon board game.\0A\00", align 1
@.str2 = private unnamed_addr constant [35 x i8] c"Copyright (C) 2001 Erik Jonsson.\0A\0A\00", align 1
@.str3 = private unnamed_addr constant [42 x i8] c"The pieces was drawn by Stefan P\E5hlson.\0A\0A\00", align 1
@.str4 = private unnamed_addr constant [63 x i8] c"This program is free software; you can redistribute it and/or\0A\00", align 1
@.str5 = private unnamed_addr constant [61 x i8] c"modify it under the terms of the GNU General Public License\0A\00", align 1
@.str6 = private unnamed_addr constant [64 x i8] c"as published by the Free Software Foundation; either version 2\0A\00", align 1
@.str7 = private unnamed_addr constant [57 x i8] c"of the License, or (at your option) any later version.\0A\0A\00", align 1
@.str8 = private unnamed_addr constant [65 x i8] c"This program is distributed in the hope that it will be useful,\0A\00", align 1
@.str9 = private unnamed_addr constant [64 x i8] c"but WITHOUT ANY WARRANTY; without even the implied warranty of\0A\00", align 1
@.str10 = private unnamed_addr constant [63 x i8] c"MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\0A\00", align 1
@.str11 = private unnamed_addr constant [47 x i8] c"GNU General Public License for more details.\0A\0A\00", align 1
@.str12 = private unnamed_addr constant [67 x i8] c"You should have received a copy of the GNU General Public License\0A\00", align 1
@.str13 = private unnamed_addr constant [61 x i8] c"along with this program; if not, write to the Free Software\0A\00", align 1
@.str14 = private unnamed_addr constant [78 x i8] c"Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.\0A\0A\00", align 1
@.str15 = private unnamed_addr constant [30 x i8] c"Email erik@nesqi.homeip.net\0A\0A\00", align 1
@.str16 = private unnamed_addr constant [42 x i8] c"        __                              \0A\00", align 1
@.str17 = private unnamed_addr constant [41 x i8] c"     __/  \5C__                          \0A\00", align 1
@.str18 = private unnamed_addr constant [40 x i8] c"  __/  \5C__/  \5C__      Hexxagon v0.3.1 \0A\00", align 1
@.str19 = private unnamed_addr constant [39 x i8] c" /  \5C__/  \5C__/  \5C     Copyright 2001 \0A\00", align 1
@.str20 = private unnamed_addr constant [39 x i8] c" \5C__/  \5C__/  \5C__/     Erik Jonsson   \0A\00", align 1
@.str21 = private unnamed_addr constant [39 x i8] c" /  \5C__/  \5C__/  \5C                    \0A\00", align 1
@.str22 = private unnamed_addr constant [39 x i8] c" \5C__/  \5C__/  \5C__/                    \0A\00", align 1
@.str23 = private unnamed_addr constant [40 x i8] c"    \5C__/  \5C__/                        \0A\00", align 1
@.str24 = private unnamed_addr constant [42 x i8] c"       \5C__/                            \0A\0A\00", align 1
@.str25 = private unnamed_addr constant [24 x i8] c" erik@nesqi.homeip.net\0A\00", align 1
@.str26 = private unnamed_addr constant [35 x i8] c" http://nesqi.homeip.net/hexxagon\0A\00", align 1
@.str27 = private unnamed_addr constant [19 x i8] c" Common commands:\0A\00", align 1
@.str28 = private unnamed_addr constant [46 x i8] c"   quit                  : Quit the program.\0A\00", align 1
@.str29 = private unnamed_addr constant [45 x i8] c"   help                  : Print this help.\0A\00", align 1
@.str30 = private unnamed_addr constant [59 x i8] c"   copyright             : Prints copyright information.\0A\0A\00", align 1
@.str31 = private unnamed_addr constant [25 x i8] c" Play related commands:\0A\00", align 1
@.str32 = private unnamed_addr constant [52 x i8] c"   jump  [FROM][TO]      : Jump from eg. A4 to B4.\0A\00", align 1
@.str33 = private unnamed_addr constant [42 x i8] c"   j     [FROM][TO]      : Same as jump.\0A\00", align 1
@.str34 = private unnamed_addr constant [49 x i8] c"   clone [TO]            : Clone to a position.\0A\00", align 1
@.str35 = private unnamed_addr constant [43 x i8] c"   c     [TO]            : Same as clone.\0A\00", align 1
@.str36 = private unnamed_addr constant [59 x i8] c"   hint                  : Let the computer move for you.\0A\00", align 1
@.str37 = private unnamed_addr constant [59 x i8] c"   board                 : Display the current playboard.\0A\00", align 1
@.str38 = private unnamed_addr constant [58 x i8] c"   undo                  : Go gack one half move. (Undo)\0A\00", align 1
@.str39 = private unnamed_addr constant [81 x i8] c"   redo                  : Goto the next half move. (If you have used \22undo\22.)\0A\0A\00", align 1
@.str40 = private unnamed_addr constant [25 x i8] c" Game related commands:\0A\00", align 1
@.str41 = private unnamed_addr constant [64 x i8] c"   time [seconds]        : Max time for the computer to think.\0A\00", align 1
@.str42 = private unnamed_addr constant [71 x i8] c"   level [level]         : Max search depth for the computer the use.\0A\00", align 1
@.str43 = private unnamed_addr constant [58 x i8] c"   load [filename]       : Load a game from a save-file.\0A\00", align 1
@.str44 = private unnamed_addr constant [66 x i8] c"   save [filename]       : Save a game (with history) to a file.\0A\00", align 1
@.str45 = private unnamed_addr constant [46 x i8] c"   newgame [CC/HC/CH/HH] : Start a new game:\0A\00", align 1
@.str46 = private unnamed_addr constant [59 x i8] c"                           HC for human against computer.\0A\00", align 1
@.str47 = private unnamed_addr constant [59 x i8] c"                           CH for computer against human.\0A\00", align 1
@.str48 = private unnamed_addr constant [63 x i8] c"                              Same as HC but computer starts.\0A\00", align 1
@.str49 = private unnamed_addr constant [62 x i8] c"                           CC for computer against computer.\0A\00", align 1
@.str50 = private unnamed_addr constant [57 x i8] c"                           HH for human against human.\0A\0A\00", align 1
@.str51 = private unnamed_addr constant [60 x i8] c" If you just hit enter your last command will be repeated.\0A\00", align 1
@.str52 = private unnamed_addr constant [17 x i8] c"Copyright 2001.\0A\00", align 1
@.str53 = private unnamed_addr constant [15 x i8] c"Erik Jonsson.\0A\00", align 1
@.str54 = private unnamed_addr constant [48 x i8] c"Type \22copyright\22 to see the copyright notice.\0A\0A\00", align 1
@_ZZ4mainE3tmp = private unnamed_addr constant [11 x i8] c"newgame CC\00", align 1
@.str55 = private unnamed_addr constant [25 x i8] c"Repeating last command.\0A\00", align 1
@.str56 = private unnamed_addr constant [5 x i8] c"quit\00", align 1
@.str57 = private unnamed_addr constant [5 x i8] c"exit\00", align 1
@.str58 = private unnamed_addr constant [5 x i8] c"help\00", align 1
@.str59 = private unnamed_addr constant [10 x i8] c"copyright\00", align 1
@.str60 = private unnamed_addr constant [7 x i8] c"level \00", align 1
@.str61 = private unnamed_addr constant [57 x i8] c"Invalid input to command \22level\22.\0AValid values are 0-9.\0A\00", align 1
@.str62 = private unnamed_addr constant [6 x i8] c"level\00", align 1
@.str63 = private unnamed_addr constant [33 x i8] c"The search level is set to: %i.\0A\00", align 1
@.str64 = private unnamed_addr constant [6 x i8] c"time \00", align 1
@.str65 = private unnamed_addr constant [23 x i8] c"Syntax: time [number]\0A\00", align 1
@.str66 = private unnamed_addr constant [5 x i8] c"time\00", align 1
@.str67 = private unnamed_addr constant [35 x i8] c"The search time is set to %i sec.\0A\00", align 1
@.str68 = private unnamed_addr constant [6 x i8] c"board\00", align 1
@.str69 = private unnamed_addr constant [5 x i8] c"undo\00", align 1
@.str70 = private unnamed_addr constant [29 x i8] c"No more moves left to undo!\0A\00", align 1
@.str71 = private unnamed_addr constant [5 x i8] c"redo\00", align 1
@.str72 = private unnamed_addr constant [27 x i8] c"There is no move to redo!\0A\00", align 1
@.str73 = private unnamed_addr constant [5 x i8] c"hint\00", align 1
@.str74 = private unnamed_addr constant [6 x i8] c"load \00", align 1
@.str75 = private unnamed_addr constant [14 x i8] c"Game loaded.\0A\00", align 1
@.str76 = private unnamed_addr constant [26 x i8] c"Error opening load-file!\0A\00", align 1
@.str77 = private unnamed_addr constant [22 x i8] c"Unknown file format.\0A\00", align 1
@.str78 = private unnamed_addr constant [31 x i8] c"Error reading from load-file!\0A\00", align 1
@.str79 = private unnamed_addr constant [5 x i8] c"load\00", align 1
@.str80 = private unnamed_addr constant [48 x i8] c"The load command needs a filename as argument.\0A\00", align 1
@.str81 = private unnamed_addr constant [6 x i8] c"save \00", align 1
@.str82 = private unnamed_addr constant [13 x i8] c"Game saved.\0A\00", align 1
@.str83 = private unnamed_addr constant [26 x i8] c"Error opening save-file!\0A\00", align 1
@.str84 = private unnamed_addr constant [29 x i8] c"Error writing to save-file!\0A\00", align 1
@.str85 = private unnamed_addr constant [5 x i8] c"save\00", align 1
@.str86 = private unnamed_addr constant [48 x i8] c"The save command needs a filename as argument.\0A\00", align 1
@.str87 = private unnamed_addr constant [9 x i8] c"newgame \00", align 1
@.str88 = private unnamed_addr constant [70 x i8] c"You have found a bug in Hexxagon! This code should never be called!!\0A\00", align 1
@.str89 = private unnamed_addr constant [29 x i8] c"Syntax: newgame HC/CH/CC/HH\0A\00", align 1
@.str90 = private unnamed_addr constant [8 x i8] c"newgame\00", align 1
@.str91 = private unnamed_addr constant [6 x i8] c"jump \00", align 1
@.str92 = private unnamed_addr constant [3 x i8] c"j \00", align 1
@.str93 = private unnamed_addr constant [15 x i8] c"Illegal move!\0A\00", align 1
@.str94 = private unnamed_addr constant [16 x i8] c"Bad cordinate.\0A\00", align 1
@.str95 = private unnamed_addr constant [41 x i8] c"Syntax: jump [FROM][TO]\0AEg. \22jump a4b4\22\0A\00", align 1
@.str96 = private unnamed_addr constant [5 x i8] c"jump\00", align 1
@.str97 = private unnamed_addr constant [2 x i8] c"j\00", align 1
@.str98 = private unnamed_addr constant [7 x i8] c"clone \00", align 1
@.str99 = private unnamed_addr constant [3 x i8] c"c \00", align 1
@.str100 = private unnamed_addr constant [20 x i8] c"Invalid cordinate.\0A\00", align 1
@.str101 = private unnamed_addr constant [35 x i8] c"Syntax: clone [TO]\0AEg. \22clone b4\22\0A\00", align 1
@.str102 = private unnamed_addr constant [6 x i8] c"clone\00", align 1
@.str103 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@.str104 = private unnamed_addr constant [53 x i8] c"Unknown command, try \22help\22 for a list of commands.\0A\00", align 1
@__llvm_gcov_ctr = internal global [19 x i64] zeroinitializer
@__llvm_gcov_ctr105 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr106 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr107 = internal global [28 x i64] zeroinitializer
@__llvm_gcov_ctr108 = internal global [303 x i64] zeroinitializer
@__llvm_gcda_edge_table = internal unnamed_addr constant [18 x i64*] [i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 1), i64* null, i64* null, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 2), i64* null, i64* null, i64* null, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 146), i64* null, i64* null, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 147), i64* null, i64* null, i64* null, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 149), i64* null, i64* null, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 150)]
@__llvm_gcov_global_state_pred = internal unnamed_addr global i32 -1
@__llvm_gcov_ctr109 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr110 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr111 = internal global [2 x i64] zeroinitializer
@__llvm_gcov_ctr112 = internal global [5 x i64] zeroinitializer
@__llvm_gcov_ctr113 = internal global [2 x i64] zeroinitializer
@0 = private unnamed_addr constant [5 x i8] c"*204\00"
@1 = private unnamed_addr constant [90 x i8] c"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.gcda\00"
@2 = private unnamed_addr constant [24 x i8] c"_Z17stripFromDblSpacePc\00"
@3 = private unnamed_addr constant [14 x i8] c"_Z9printCopyv\00"
@4 = private unnamed_addr constant [14 x i8] c"_Z9printHelpv\00"
@5 = private unnamed_addr constant [17 x i8] c"_Z10parseCordsPc\00"
@6 = private unnamed_addr constant [5 x i8] c"main\00"
@7 = private unnamed_addr constant [47 x i8] c"_ZN12HexxagonGame11isMoveValidER12HexxagonMove\00"
@8 = private unnamed_addr constant [22 x i8] c"_ZN12HexxagonMoveC2Ev\00"
@9 = private unnamed_addr constant [30 x i8] c"_ZN12HexxagonGame9endOfGameEv\00"
@10 = private unnamed_addr constant [22 x i8] c"_ZN12HexxagonGameD2Ev\00"
@11 = private unnamed_addr constant [33 x i8] c"_ZN12HexxagonGame11displayTextEv\00"
@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 0, void ()* @__llvm_gcov_init }]

; Function Attrs: nounwind uwtable
define void @_Z17stripFromDblSpacePc(i8* %cpfrom) #0 {
entry:
  %0 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr, i64 0, i64 0)
  %cpfrom.addr = alloca i8*, align 8
  %cpto = alloca i8*, align 8
  %space = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr, i64 0, i64 1)
  store i8* %cpfrom, i8** %cpfrom.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %cpfrom.addr, metadata !197, metadata !198), !dbg !199
  call void @llvm.dbg.declare(metadata i8** %cpto, metadata !200, metadata !198), !dbg !201
  %5 = load i8** %cpfrom.addr, align 8, !dbg !202
  store i8* %5, i8** %cpto, align 8, !dbg !201
  call void @llvm.dbg.declare(metadata i32* %space, metadata !203, metadata !198), !dbg !204
  store i32 1, i32* %space, align 4, !dbg !204
  br label %while.cond, !dbg !205

while.cond:                                       ; preds = %if.end10, %2
  %6 = load i8** %cpfrom.addr, align 8, !dbg !206
  %7 = load i8* %6, align 1, !dbg !209
  %tobool = icmp ne i8 %7, 0, !dbg !209
  %8 = select i1 %tobool, i64 2, i64 3, !dbg !205
  %9 = getelementptr inbounds [19 x i64]* @__llvm_gcov_ctr, i64 0, i64 %8, !dbg !205
  %10 = load i64* %9, !dbg !205
  %11 = add i64 %10, 1, !dbg !205
  store i64 %11, i64* %9, !dbg !205
  br i1 %tobool, label %while.body, label %while.end, !dbg !205

while.body:                                       ; preds = %while.cond
  %12 = load i32* %space, align 4, !dbg !210
  %tobool1 = icmp ne i32 %12, 0, !dbg !210
  %13 = select i1 %tobool1, i64 4, i64 5, !dbg !213
  %14 = getelementptr inbounds [19 x i64]* @__llvm_gcov_ctr, i64 0, i64 %13, !dbg !213
  %15 = load i64* %14, !dbg !213
  %16 = add i64 %15, 1, !dbg !213
  store i64 %16, i64* %14, !dbg !213
  br i1 %tobool1, label %land.lhs.true, label %if.then, !dbg !213

land.lhs.true:                                    ; preds = %while.body
  %17 = load i8** %cpfrom.addr, align 8, !dbg !214
  %18 = load i8* %17, align 1, !dbg !216
  %conv = sext i8 %18 to i32, !dbg !216
  %cmp = icmp eq i32 %conv, 32, !dbg !216
  %19 = select i1 %cmp, i64 6, i64 7, !dbg !213
  %20 = getelementptr inbounds [19 x i64]* @__llvm_gcov_ctr, i64 0, i64 %19, !dbg !213
  %21 = load i64* %20, !dbg !213
  %22 = add i64 %21, 1, !dbg !213
  store i64 %22, i64* %20, !dbg !213
  br i1 %cmp, label %if.end, label %lor.lhs.false, !dbg !213

lor.lhs.false:                                    ; preds = %land.lhs.true
  %23 = load i8** %cpfrom.addr, align 8, !dbg !217
  %24 = load i8* %23, align 1, !dbg !219
  %conv2 = sext i8 %24 to i32, !dbg !219
  %cmp3 = icmp eq i32 %conv2, 9, !dbg !219
  %25 = select i1 %cmp3, i64 8, i64 9, !dbg !213
  %26 = getelementptr inbounds [19 x i64]* @__llvm_gcov_ctr, i64 0, i64 %25, !dbg !213
  %27 = load i64* %26, !dbg !213
  %28 = add i64 %27, 1, !dbg !213
  store i64 %28, i64* %26, !dbg !213
  br i1 %cmp3, label %if.end, label %if.then, !dbg !213

if.then:                                          ; preds = %lor.lhs.false, %while.body
  %29 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr, i64 0, i64 10), !dbg !220
  %30 = add i64 %29, 1, !dbg !220
  store i64 %30, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr, i64 0, i64 10), !dbg !220
  %31 = load i8** %cpfrom.addr, align 8, !dbg !220
  %32 = load i8* %31, align 1, !dbg !222
  %33 = load i8** %cpto, align 8, !dbg !223
  store i8 %32, i8* %33, align 1, !dbg !224
  %34 = load i8** %cpto, align 8, !dbg !225
  %incdec.ptr = getelementptr inbounds i8* %34, i32 1, !dbg !225
  store i8* %incdec.ptr, i8** %cpto, align 8, !dbg !225
  br label %if.end, !dbg !226

if.end:                                           ; preds = %if.then, %lor.lhs.false, %land.lhs.true
  %35 = load i8** %cpfrom.addr, align 8, !dbg !227
  %36 = load i8* %35, align 1, !dbg !229
  %conv4 = sext i8 %36 to i32, !dbg !229
  %cmp5 = icmp eq i32 %conv4, 32, !dbg !229
  %37 = select i1 %cmp5, i64 11, i64 12, !dbg !230
  %38 = getelementptr inbounds [19 x i64]* @__llvm_gcov_ctr, i64 0, i64 %37, !dbg !230
  %39 = load i64* %38, !dbg !230
  %40 = add i64 %39, 1, !dbg !230
  store i64 %40, i64* %38, !dbg !230
  br i1 %cmp5, label %if.then9, label %lor.lhs.false6, !dbg !230

lor.lhs.false6:                                   ; preds = %if.end
  %41 = load i8** %cpfrom.addr, align 8, !dbg !231
  %42 = load i8* %41, align 1, !dbg !233
  %conv7 = sext i8 %42 to i32, !dbg !233
  %cmp8 = icmp eq i32 %conv7, 9, !dbg !233
  %43 = select i1 %cmp8, i64 13, i64 14, !dbg !230
  %44 = getelementptr inbounds [19 x i64]* @__llvm_gcov_ctr, i64 0, i64 %43, !dbg !230
  %45 = load i64* %44, !dbg !230
  %46 = add i64 %45, 1, !dbg !230
  store i64 %46, i64* %44, !dbg !230
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !230

if.then9:                                         ; preds = %lor.lhs.false6, %if.end
  %47 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr, i64 0, i64 15), !dbg !234
  %48 = add i64 %47, 1, !dbg !234
  store i64 %48, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr, i64 0, i64 15), !dbg !234
  store i32 1, i32* %space, align 4, !dbg !234
  br label %if.end10, !dbg !234

if.else:                                          ; preds = %lor.lhs.false6
  %49 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr, i64 0, i64 16), !dbg !235
  %50 = add i64 %49, 1, !dbg !235
  store i64 %50, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr, i64 0, i64 16), !dbg !235
  store i32 0, i32* %space, align 4, !dbg !235
  br label %if.end10

if.end10:                                         ; preds = %if.else, %if.then9
  %51 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr, i64 0, i64 17), !dbg !236
  %52 = add i64 %51, 1, !dbg !236
  store i64 %52, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr, i64 0, i64 17), !dbg !236
  %53 = load i8** %cpfrom.addr, align 8, !dbg !236
  %incdec.ptr11 = getelementptr inbounds i8* %53, i32 1, !dbg !236
  store i8* %incdec.ptr11, i8** %cpfrom.addr, align 8, !dbg !236
  br label %while.cond, !dbg !205

while.end:                                        ; preds = %while.cond
  %54 = load i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr, i64 0, i64 18), !dbg !237
  %55 = add i64 %54, 1, !dbg !237
  store i64 %55, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr, i64 0, i64 18), !dbg !237
  %56 = load i8** %cpto, align 8, !dbg !237
  store i8 0, i8* %56, align 1, !dbg !238
  ret void, !dbg !239
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: uwtable
define void @_Z9printCopyv() #2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr105, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr105, i64 0, i64 0)
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr105, i64 0, i64 1), !dbg !240
  %4 = add i64 %3, 1, !dbg !240
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr105, i64 0, i64 1), !dbg !240
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)), !dbg !240
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0)), !dbg !241
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str2, i32 0, i32 0)), !dbg !242
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str3, i32 0, i32 0)), !dbg !243
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([63 x i8]* @.str4, i32 0, i32 0)), !dbg !244
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([61 x i8]* @.str5, i32 0, i32 0)), !dbg !245
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([64 x i8]* @.str6, i32 0, i32 0)), !dbg !246
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([57 x i8]* @.str7, i32 0, i32 0)), !dbg !247
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([65 x i8]* @.str8, i32 0, i32 0)), !dbg !248
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([64 x i8]* @.str9, i32 0, i32 0)), !dbg !249
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([63 x i8]* @.str10, i32 0, i32 0)), !dbg !250
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([47 x i8]* @.str11, i32 0, i32 0)), !dbg !251
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([67 x i8]* @.str12, i32 0, i32 0)), !dbg !252
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([61 x i8]* @.str13, i32 0, i32 0)), !dbg !253
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([78 x i8]* @.str14, i32 0, i32 0)), !dbg !254
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str15, i32 0, i32 0)), !dbg !255
  ret void, !dbg !256
}

declare i32 @printf(i8*, ...) #3

; Function Attrs: uwtable
define void @_Z9printHelpv() #2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr106, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr106, i64 0, i64 0)
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr106, i64 0, i64 1), !dbg !257
  %4 = add i64 %3, 1, !dbg !257
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr106, i64 0, i64 1), !dbg !257
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str16, i32 0, i32 0)), !dbg !257
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str17, i32 0, i32 0)), !dbg !258
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str18, i32 0, i32 0)), !dbg !259
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str19, i32 0, i32 0)), !dbg !260
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str20, i32 0, i32 0)), !dbg !261
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str21, i32 0, i32 0)), !dbg !262
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str22, i32 0, i32 0)), !dbg !263
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str23, i32 0, i32 0)), !dbg !264
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str24, i32 0, i32 0)), !dbg !265
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str25, i32 0, i32 0)), !dbg !266
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str26, i32 0, i32 0)), !dbg !267
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)), !dbg !268
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str27, i32 0, i32 0)), !dbg !269
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([46 x i8]* @.str28, i32 0, i32 0)), !dbg !270
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str29, i32 0, i32 0)), !dbg !271
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([59 x i8]* @.str30, i32 0, i32 0)), !dbg !272
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str31, i32 0, i32 0)), !dbg !273
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([52 x i8]* @.str32, i32 0, i32 0)), !dbg !274
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str33, i32 0, i32 0)), !dbg !275
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([49 x i8]* @.str34, i32 0, i32 0)), !dbg !276
  %call20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str35, i32 0, i32 0)), !dbg !277
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([59 x i8]* @.str36, i32 0, i32 0)), !dbg !278
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([59 x i8]* @.str37, i32 0, i32 0)), !dbg !279
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([58 x i8]* @.str38, i32 0, i32 0)), !dbg !280
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([81 x i8]* @.str39, i32 0, i32 0)), !dbg !281
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str40, i32 0, i32 0)), !dbg !282
  %call26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([64 x i8]* @.str41, i32 0, i32 0)), !dbg !283
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([71 x i8]* @.str42, i32 0, i32 0)), !dbg !284
  %call28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([58 x i8]* @.str43, i32 0, i32 0)), !dbg !285
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([66 x i8]* @.str44, i32 0, i32 0)), !dbg !286
  %call30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([46 x i8]* @.str45, i32 0, i32 0)), !dbg !287
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([59 x i8]* @.str46, i32 0, i32 0)), !dbg !288
  %call32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([59 x i8]* @.str47, i32 0, i32 0)), !dbg !289
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([63 x i8]* @.str48, i32 0, i32 0)), !dbg !290
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([62 x i8]* @.str49, i32 0, i32 0)), !dbg !291
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([57 x i8]* @.str50, i32 0, i32 0)), !dbg !292
  %call36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([60 x i8]* @.str51, i32 0, i32 0)), !dbg !293
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)), !dbg !294
  ret void, !dbg !295
}

; Function Attrs: uwtable
define i32 @_Z10parseCordsPc(i8* %str) #2 {
entry:
  %0 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 0)
  %retval = alloca i32, align 4
  %str.addr = alloca i8*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  store i8* %str, i8** %str.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %str.addr, metadata !296, metadata !198), !dbg !297
  %3 = load i8** %str.addr, align 8, !dbg !298
  %4 = load i8* %3, align 1, !dbg !300
  %conv = sext i8 %4 to i32, !dbg !300
  %cmp = icmp sge i32 %conv, 97, !dbg !300
  %5 = select i1 %cmp, i64 1, i64 2, !dbg !301
  %6 = getelementptr inbounds [28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 %5, !dbg !301
  %7 = load i64* %6, !dbg !301
  %8 = add i64 %7, 1, !dbg !301
  store i64 %8, i64* %6, !dbg !301
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false, !dbg !301

land.lhs.true:                                    ; preds = %2
  %9 = load i8** %str.addr, align 8, !dbg !302
  %10 = load i8* %9, align 1, !dbg !304
  %conv1 = sext i8 %10 to i32, !dbg !304
  %cmp2 = icmp sle i32 %conv1, 105, !dbg !304
  %11 = select i1 %cmp2, i64 3, i64 4, !dbg !301
  %12 = getelementptr inbounds [28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 %11, !dbg !301
  %13 = load i64* %12, !dbg !301
  %14 = add i64 %13, 1, !dbg !301
  store i64 %14, i64* %12, !dbg !301
  br i1 %cmp2, label %land.lhs.true8, label %lor.lhs.false, !dbg !301

lor.lhs.false:                                    ; preds = %land.lhs.true, %2
  %15 = load i8** %str.addr, align 8, !dbg !305
  %16 = load i8* %15, align 1, !dbg !306
  %conv3 = sext i8 %16 to i32, !dbg !306
  %cmp4 = icmp sge i32 %conv3, 65, !dbg !306
  %17 = select i1 %cmp4, i64 5, i64 6, !dbg !301
  %18 = getelementptr inbounds [28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 %17, !dbg !301
  %19 = load i64* %18, !dbg !301
  %20 = add i64 %19, 1, !dbg !301
  store i64 %20, i64* %18, !dbg !301
  br i1 %cmp4, label %land.lhs.true5, label %if.end36, !dbg !301

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %21 = load i8** %str.addr, align 8, !dbg !307
  %22 = load i8* %21, align 1, !dbg !308
  %conv6 = sext i8 %22 to i32, !dbg !308
  %cmp7 = icmp sle i32 %conv6, 73, !dbg !308
  %23 = select i1 %cmp7, i64 7, i64 8, !dbg !301
  %24 = getelementptr inbounds [28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 %23, !dbg !301
  %25 = load i64* %24, !dbg !301
  %26 = add i64 %25, 1, !dbg !301
  store i64 %26, i64* %24, !dbg !301
  br i1 %cmp7, label %land.lhs.true8, label %if.end36, !dbg !301

land.lhs.true8:                                   ; preds = %land.lhs.true5, %land.lhs.true
  %27 = load i8** %str.addr, align 8, !dbg !309
  %arrayidx = getelementptr inbounds i8* %27, i64 1, !dbg !309
  %28 = load i8* %arrayidx, align 1, !dbg !309
  %conv9 = sext i8 %28 to i32, !dbg !309
  %cmp10 = icmp sge i32 %conv9, 49, !dbg !309
  %29 = select i1 %cmp10, i64 9, i64 10, !dbg !301
  %30 = getelementptr inbounds [28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 %29, !dbg !301
  %31 = load i64* %30, !dbg !301
  %32 = add i64 %31, 1, !dbg !301
  store i64 %32, i64* %30, !dbg !301
  br i1 %cmp10, label %land.lhs.true11, label %if.end36, !dbg !301

land.lhs.true11:                                  ; preds = %land.lhs.true8
  %33 = load i8** %str.addr, align 8, !dbg !310
  %arrayidx12 = getelementptr inbounds i8* %33, i64 1, !dbg !310
  %34 = load i8* %arrayidx12, align 1, !dbg !310
  %conv13 = sext i8 %34 to i32, !dbg !310
  %cmp14 = icmp sle i32 %conv13, 57, !dbg !310
  %35 = select i1 %cmp14, i64 11, i64 12, !dbg !301
  %36 = getelementptr inbounds [28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 %35, !dbg !301
  %37 = load i64* %36, !dbg !301
  %38 = add i64 %37, 1, !dbg !301
  store i64 %38, i64* %36, !dbg !301
  br i1 %cmp14, label %if.then, label %if.end36, !dbg !301

if.then:                                          ; preds = %land.lhs.true11
  call void @llvm.dbg.declare(metadata i32* %x, metadata !311, metadata !198), !dbg !313
  call void @llvm.dbg.declare(metadata i32* %y, metadata !314, metadata !198), !dbg !315
  %39 = load i8** %str.addr, align 8, !dbg !316
  %40 = load i8* %39, align 1, !dbg !318
  %conv15 = sext i8 %40 to i32, !dbg !318
  %cmp16 = icmp sge i32 %conv15, 97, !dbg !318
  %41 = select i1 %cmp16, i64 13, i64 14, !dbg !319
  %42 = getelementptr inbounds [28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 %41, !dbg !319
  %43 = load i64* %42, !dbg !319
  %44 = add i64 %43, 1, !dbg !319
  store i64 %44, i64* %42, !dbg !319
  br i1 %cmp16, label %land.lhs.true17, label %if.else, !dbg !319

land.lhs.true17:                                  ; preds = %if.then
  %45 = load i8** %str.addr, align 8, !dbg !320
  %46 = load i8* %45, align 1, !dbg !322
  %conv18 = sext i8 %46 to i32, !dbg !322
  %cmp19 = icmp sle i32 %conv18, 105, !dbg !322
  %47 = select i1 %cmp19, i64 15, i64 16, !dbg !319
  %48 = getelementptr inbounds [28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 %47, !dbg !319
  %49 = load i64* %48, !dbg !319
  %50 = add i64 %49, 1, !dbg !319
  store i64 %50, i64* %48, !dbg !319
  br i1 %cmp19, label %if.then20, label %if.else, !dbg !319

if.then20:                                        ; preds = %land.lhs.true17
  %51 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 17), !dbg !323
  %52 = add i64 %51, 1, !dbg !323
  store i64 %52, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 17), !dbg !323
  %53 = load i8** %str.addr, align 8, !dbg !323
  %54 = load i8* %53, align 1, !dbg !324
  %conv21 = sext i8 %54 to i32, !dbg !324
  %sub = sub nsw i32 %conv21, 97, !dbg !324
  store i32 %sub, i32* %x, align 4, !dbg !325
  br label %if.end31, !dbg !325

if.else:                                          ; preds = %land.lhs.true17, %if.then
  %55 = load i8** %str.addr, align 8, !dbg !326
  %56 = load i8* %55, align 1, !dbg !328
  %conv22 = sext i8 %56 to i32, !dbg !328
  %cmp23 = icmp sge i32 %conv22, 65, !dbg !328
  %57 = select i1 %cmp23, i64 18, i64 19, !dbg !329
  %58 = getelementptr inbounds [28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 %57, !dbg !329
  %59 = load i64* %58, !dbg !329
  %60 = add i64 %59, 1, !dbg !329
  store i64 %60, i64* %58, !dbg !329
  br i1 %cmp23, label %land.lhs.true24, label %if.else30, !dbg !329

land.lhs.true24:                                  ; preds = %if.else
  %61 = load i8** %str.addr, align 8, !dbg !330
  %62 = load i8* %61, align 1, !dbg !332
  %conv25 = sext i8 %62 to i32, !dbg !332
  %cmp26 = icmp sle i32 %conv25, 73, !dbg !332
  %63 = select i1 %cmp26, i64 20, i64 21, !dbg !329
  %64 = getelementptr inbounds [28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 %63, !dbg !329
  %65 = load i64* %64, !dbg !329
  %66 = add i64 %65, 1, !dbg !329
  store i64 %66, i64* %64, !dbg !329
  br i1 %cmp26, label %if.then27, label %if.else30, !dbg !329

if.then27:                                        ; preds = %land.lhs.true24
  %67 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 22), !dbg !333
  %68 = add i64 %67, 1, !dbg !333
  store i64 %68, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 22), !dbg !333
  %69 = load i8** %str.addr, align 8, !dbg !333
  %70 = load i8* %69, align 1, !dbg !334
  %conv28 = sext i8 %70 to i32, !dbg !334
  %sub29 = sub nsw i32 %conv28, 65, !dbg !334
  store i32 %sub29, i32* %x, align 4, !dbg !335
  br label %if.end, !dbg !335

if.else30:                                        ; preds = %land.lhs.true24, %if.else
  %71 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 23), !dbg !336
  %72 = add i64 %71, 1, !dbg !336
  store i64 %72, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 23), !dbg !336
  store i32 -1, i32* %retval, !dbg !336
  br label %return, !dbg !336

if.end:                                           ; preds = %if.then27
  %73 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 24)
  %74 = add i64 %73, 1
  store i64 %74, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 24)
  br label %if.end31

if.end31:                                         ; preds = %if.end, %if.then20
  %75 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 25), !dbg !337
  %76 = add i64 %75, 1, !dbg !337
  store i64 %76, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 25), !dbg !337
  %77 = load i8** %str.addr, align 8, !dbg !337
  %arrayidx32 = getelementptr inbounds i8* %77, i64 1, !dbg !337
  %78 = load i8* %arrayidx32, align 1, !dbg !337
  %conv33 = sext i8 %78 to i32, !dbg !337
  %sub34 = sub nsw i32 %conv33, 49, !dbg !337
  store i32 %sub34, i32* %y, align 4, !dbg !338
  %79 = load i32* %x, align 4, !dbg !339
  %add = add nsw i32 %79, 1, !dbg !339
  %80 = load i32* %y, align 4, !dbg !340
  %add35 = add nsw i32 %80, 1, !dbg !340
  %call = call i32 @_Z16getHexxagonIndexii(i32 %add, i32 %add35), !dbg !341
  store i32 %call, i32* %retval, !dbg !342
  br label %return, !dbg !342

if.end36:                                         ; preds = %land.lhs.true11, %land.lhs.true8, %land.lhs.true5, %lor.lhs.false
  %81 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 26), !dbg !343
  %82 = add i64 %81, 1, !dbg !343
  store i64 %82, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 26), !dbg !343
  store i32 -1, i32* %retval, !dbg !343
  br label %return, !dbg !343

return:                                           ; preds = %if.end36, %if.end31, %if.else30
  %83 = load i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 27), !dbg !344
  %84 = add i64 %83, 1, !dbg !344
  store i64 %84, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 27), !dbg !344
  %85 = load i32* %retval, !dbg !344
  ret i32 %85, !dbg !344
}

declare i32 @_Z16getHexxagonIndexii(i32, i32) #3

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #2 {
entry:
  %0 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 0)
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %quit = alloca i32, align 4
  %mode = alloca i32, align 4
  %level = alloca i32, align 4
  %time = alloca i32, align 4
  %llvm_index = alloca i32, align 4
  %game = alloca %class.HexxagonGame*, align 8
  %exn.slot = alloca i8*
  %ehselector.slot = alloca i32
  %input = alloca i8*, align 8
  %tmp = alloca [11 x i8], align 1
  %len = alloca i32, align 4
  %cp = alloca i8*, align 8
  %ret = alloca i32, align 4
  %ret160 = alloca i32, align 4
  %cp330 = alloca i8*, align 8
  %move = alloca %class.HexxagonMove, align 4
  %len340 = alloca i32, align 4
  %cp420 = alloca i8*, align 8
  %move429 = alloca %class.HexxagonMove, align 4
  br label %2

; <label>:2                                       ; preds = %entry
  store i32 0, i32* @__llvm_gcov_global_state_pred
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !345, metadata !198), !dbg !346
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !347, metadata !198), !dbg !348
  call void @llvm.dbg.declare(metadata i32* %quit, metadata !349, metadata !198), !dbg !350
  store i32 0, i32* %quit, align 4, !dbg !350
  call void @llvm.dbg.declare(metadata i32* %mode, metadata !351, metadata !198), !dbg !352
  store i32 1, i32* %mode, align 4, !dbg !352
  call void @llvm.dbg.declare(metadata i32* %level, metadata !353, metadata !198), !dbg !354
  store i32 4, i32* %level, align 4, !dbg !354
  call void @llvm.dbg.declare(metadata i32* %time, metadata !355, metadata !198), !dbg !356
  store i32 12, i32* %time, align 4, !dbg !356
  call void @llvm.dbg.declare(metadata i32* %llvm_index, metadata !357, metadata !198), !dbg !358
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0)), !dbg !359
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str52, i32 0, i32 0)), !dbg !360
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str53, i32 0, i32 0)), !dbg !361
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str54, i32 0, i32 0)), !dbg !362
  call void @llvm.dbg.declare(metadata %class.HexxagonGame** %game, metadata !363, metadata !198), !dbg !365
  %call4 = call noalias i8* @_Znwm(i64 24) #10, !dbg !366
  %3 = bitcast i8* %call4 to %class.HexxagonGame*, !dbg !366
  invoke void @_ZN12HexxagonGameC1Ev(%class.HexxagonGame* %3)
          to label %invoke.cont unwind label %lpad, !dbg !366

invoke.cont:                                      ; preds = %2
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred, i64** getelementptr inbounds ([18 x i64*]* @__llvm_gcda_edge_table, i64 0, i64 0)), !dbg !367
  %4 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 3), !dbg !367
  %5 = add i64 %4, 1, !dbg !367
  store i64 %5, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 3), !dbg !367
  store %class.HexxagonGame* %3, %class.HexxagonGame** %game, align 8, !dbg !367
  %6 = load %class.HexxagonGame** %game, align 8, !dbg !369
  call void @_ZN12HexxagonGame11displayTextEv(%class.HexxagonGame* %6), !dbg !369
  call void @llvm.dbg.declare(metadata i8** %input, metadata !370, metadata !198), !dbg !371
  store i8* null, i8** %input, align 8, !dbg !371
  store i32 0, i32* %llvm_index, align 4, !dbg !372
  br label %for.cond, !dbg !372

for.cond:                                         ; preds = %for.inc, %invoke.cont
  %7 = load i32* %llvm_index, align 4, !dbg !374
  %cmp = icmp slt i32 %7, 1, !dbg !374
  %8 = select i1 %cmp, i64 4, i64 5, !dbg !378
  %9 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %8, !dbg !378
  %10 = load i64* %9, !dbg !378
  %11 = add i64 %10, 1, !dbg !378
  store i64 %11, i64* %9, !dbg !378
  br i1 %cmp, label %for.body, label %for.end, !dbg !378

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %tmp, metadata !379, metadata !198), !dbg !384
  %12 = bitcast [11 x i8]* %tmp to i8*, !dbg !384
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* getelementptr inbounds ([11 x i8]* @_ZZ4mainE3tmp, i32 0, i32 0), i64 11, i32 1, i1 false), !dbg !384
  call void @llvm.dbg.declare(metadata i32* %len, metadata !385, metadata !198), !dbg !386
  %arraydecay = getelementptr inbounds [11 x i8]* %tmp, i32 0, i32 0, !dbg !387
  %call6 = call i64 @strlen(i8* %arraydecay) #11, !dbg !388
  %conv = trunc i64 %call6 to i32, !dbg !388
  store i32 %conv, i32* %len, align 4, !dbg !386
  %13 = load i32* %len, align 4, !dbg !389
  %tobool = icmp ne i32 %13, 0, !dbg !389
  %14 = select i1 %tobool, i64 6, i64 7, !dbg !391
  %15 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %14, !dbg !391
  %16 = load i64* %15, !dbg !391
  %17 = add i64 %16, 1, !dbg !391
  store i64 %17, i64* %15, !dbg !391
  br i1 %tobool, label %land.lhs.true, label %if.end, !dbg !391

land.lhs.true:                                    ; preds = %for.body
  %18 = load i32* %len, align 4, !dbg !392
  %sub = sub nsw i32 %18, 1, !dbg !392
  %idxprom = sext i32 %sub to i64, !dbg !394
  %arrayidx = getelementptr inbounds [11 x i8]* %tmp, i32 0, i64 %idxprom, !dbg !394
  %19 = load i8* %arrayidx, align 1, !dbg !394
  %conv7 = sext i8 %19 to i32, !dbg !394
  %cmp8 = icmp eq i32 %conv7, 32, !dbg !394
  %20 = select i1 %cmp8, i64 8, i64 9, !dbg !391
  %21 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %20, !dbg !391
  %22 = load i64* %21, !dbg !391
  %23 = add i64 %22, 1, !dbg !391
  store i64 %23, i64* %21, !dbg !391
  br i1 %cmp8, label %if.then, label %if.end, !dbg !391

if.then:                                          ; preds = %land.lhs.true
  %24 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 10), !dbg !395
  %25 = add i64 %24, 1, !dbg !395
  store i64 %25, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 10), !dbg !395
  %26 = load i32* %len, align 4, !dbg !395
  %sub9 = sub nsw i32 %26, 1, !dbg !395
  %idxprom10 = sext i32 %sub9 to i64, !dbg !396
  %arrayidx11 = getelementptr inbounds [11 x i8]* %tmp, i32 0, i64 %idxprom10, !dbg !396
  store i8 0, i8* %arrayidx11, align 1, !dbg !396
  br label %if.end, !dbg !396

lpad:                                             ; preds = %2
  %27 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !397
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred, i64** getelementptr inbounds ([18 x i64*]* @__llvm_gcda_edge_table, i64 0, i64 3)), !dbg !397
  %28 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 11), !dbg !397
  %29 = add i64 %28, 1, !dbg !397
  store i64 %29, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 11), !dbg !397
  %30 = extractvalue { i8*, i32 } %27, 0, !dbg !397
  store i8* %30, i8** %exn.slot, !dbg !397
  %31 = extractvalue { i8*, i32 } %27, 1, !dbg !397
  store i32 %31, i32* %ehselector.slot, !dbg !397
  call void @_ZdlPv(i8* %call4) #12, !dbg !397
  br label %eh.resume, !dbg !397

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  %arraydecay12 = getelementptr inbounds [11 x i8]* %tmp, i32 0, i32 0, !dbg !398
  %32 = load i8* %arraydecay12, align 1, !dbg !400
  %conv13 = sext i8 %32 to i32, !dbg !400
  %cmp14 = icmp eq i32 %conv13, 0, !dbg !400
  %33 = select i1 %cmp14, i64 12, i64 13, !dbg !401
  %34 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %33, !dbg !401
  %35 = load i64* %34, !dbg !401
  %36 = add i64 %35, 1, !dbg !401
  store i64 %36, i64* %34, !dbg !401
  br i1 %cmp14, label %if.then15, label %if.else, !dbg !401

if.then15:                                        ; preds = %if.end
  %37 = load i8** %input, align 8, !dbg !402
  %tobool16 = icmp ne i8* %37, null, !dbg !402
  %38 = select i1 %tobool16, i64 14, i64 15, !dbg !405
  %39 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %38, !dbg !405
  %40 = load i64* %39, !dbg !405
  %41 = add i64 %40, 1, !dbg !405
  store i64 %41, i64* %39, !dbg !405
  br i1 %tobool16, label %if.then17, label %if.end19, !dbg !405

if.then17:                                        ; preds = %if.then15
  %42 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 16), !dbg !406
  %43 = add i64 %42, 1, !dbg !406
  store i64 %43, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 16), !dbg !406
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str55, i32 0, i32 0)), !dbg !406
  br label %if.end19, !dbg !406

if.end19:                                         ; preds = %if.then17, %if.then15
  %44 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 17), !dbg !407
  %45 = add i64 %44, 1, !dbg !407
  store i64 %45, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 17), !dbg !407
  br label %if.end21, !dbg !407

if.else:                                          ; preds = %if.end
  %46 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 18), !dbg !408
  %47 = add i64 %46, 1, !dbg !408
  store i64 %47, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 18), !dbg !408
  %arraydecay20 = getelementptr inbounds [11 x i8]* %tmp, i32 0, i32 0, !dbg !408
  store i8* %arraydecay20, i8** %input, align 8, !dbg !410
  br label %if.end21

if.end21:                                         ; preds = %if.else, %if.end19
  %48 = load i8** %input, align 8, !dbg !411
  %tobool22 = icmp ne i8* %48, null, !dbg !411
  %49 = select i1 %tobool22, i64 19, i64 20, !dbg !413
  %50 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %49, !dbg !413
  %51 = load i64* %50, !dbg !413
  %52 = add i64 %51, 1, !dbg !413
  store i64 %52, i64* %50, !dbg !413
  br i1 %tobool22, label %if.end24, label %if.then23, !dbg !413

if.then23:                                        ; preds = %if.end21
  %53 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 21), !dbg !414
  %54 = add i64 %53, 1, !dbg !414
  store i64 %54, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 21), !dbg !414
  br label %for.inc, !dbg !414

if.end24:                                         ; preds = %if.end21
  %55 = load i8** %input, align 8, !dbg !415
  %call25 = call i32 @strcasecmp(i8* getelementptr inbounds ([5 x i8]* @.str56, i32 0, i32 0), i8* %55) #11, !dbg !417
  %tobool26 = icmp ne i32 %call25, 0, !dbg !417
  %56 = select i1 %tobool26, i64 22, i64 23, !dbg !418
  %57 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %56, !dbg !418
  %58 = load i64* %57, !dbg !418
  %59 = add i64 %58, 1, !dbg !418
  store i64 %59, i64* %57, !dbg !418
  br i1 %tobool26, label %lor.lhs.false, label %if.then29, !dbg !418

lor.lhs.false:                                    ; preds = %if.end24
  %60 = load i8** %input, align 8, !dbg !419
  %call27 = call i32 @strcasecmp(i8* getelementptr inbounds ([5 x i8]* @.str57, i32 0, i32 0), i8* %60) #11, !dbg !421
  %tobool28 = icmp ne i32 %call27, 0, !dbg !421
  %61 = select i1 %tobool28, i64 24, i64 25, !dbg !418
  %62 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %61, !dbg !418
  %63 = load i64* %62, !dbg !418
  %64 = add i64 %63, 1, !dbg !418
  store i64 %64, i64* %62, !dbg !418
  br i1 %tobool28, label %if.else30, label %if.then29, !dbg !418

if.then29:                                        ; preds = %lor.lhs.false, %if.end24
  %65 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 26), !dbg !422
  %66 = add i64 %65, 1, !dbg !422
  store i64 %66, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 26), !dbg !422
  store i32 1, i32* %quit, align 4, !dbg !422
  br label %if.end490, !dbg !424

if.else30:                                        ; preds = %lor.lhs.false
  %67 = load i8** %input, align 8, !dbg !425
  %call31 = call i32 @strcasecmp(i8* getelementptr inbounds ([5 x i8]* @.str58, i32 0, i32 0), i8* %67) #11, !dbg !427
  %tobool32 = icmp ne i32 %call31, 0, !dbg !427
  %68 = select i1 %tobool32, i64 27, i64 28, !dbg !428
  %69 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %68, !dbg !428
  %70 = load i64* %69, !dbg !428
  %71 = add i64 %70, 1, !dbg !428
  store i64 %71, i64* %69, !dbg !428
  br i1 %tobool32, label %if.else34, label %if.then33, !dbg !428

if.then33:                                        ; preds = %if.else30
  %72 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 29), !dbg !429
  %73 = add i64 %72, 1, !dbg !429
  store i64 %73, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 29), !dbg !429
  call void @_Z9printHelpv(), !dbg !429
  br label %if.end489, !dbg !429

if.else34:                                        ; preds = %if.else30
  %74 = load i8** %input, align 8, !dbg !430
  %call35 = call i32 @strcasecmp(i8* getelementptr inbounds ([10 x i8]* @.str59, i32 0, i32 0), i8* %74) #11, !dbg !432
  %tobool36 = icmp ne i32 %call35, 0, !dbg !432
  %75 = select i1 %tobool36, i64 30, i64 31, !dbg !433
  %76 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %75, !dbg !433
  %77 = load i64* %76, !dbg !433
  %78 = add i64 %77, 1, !dbg !433
  store i64 %78, i64* %76, !dbg !433
  br i1 %tobool36, label %if.else38, label %if.then37, !dbg !433

if.then37:                                        ; preds = %if.else34
  %79 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 32), !dbg !434
  %80 = add i64 %79, 1, !dbg !434
  store i64 %80, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 32), !dbg !434
  call void @_Z9printCopyv(), !dbg !434
  br label %if.end488, !dbg !434

if.else38:                                        ; preds = %if.else34
  %81 = load i8** %input, align 8, !dbg !435
  %call39 = call i32 @strncasecmp(i8* getelementptr inbounds ([7 x i8]* @.str60, i32 0, i32 0), i8* %81, i64 6) #11, !dbg !437
  %tobool40 = icmp ne i32 %call39, 0, !dbg !437
  %82 = select i1 %tobool40, i64 33, i64 34, !dbg !438
  %83 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %82, !dbg !438
  %84 = load i64* %83, !dbg !438
  %85 = add i64 %84, 1, !dbg !438
  store i64 %85, i64* %83, !dbg !438
  br i1 %tobool40, label %if.else57, label %if.then41, !dbg !438

if.then41:                                        ; preds = %if.else38
  %86 = load i8** %input, align 8, !dbg !439
  %arrayidx42 = getelementptr inbounds i8* %86, i64 6, !dbg !439
  %87 = load i8* %arrayidx42, align 1, !dbg !439
  %conv43 = sext i8 %87 to i32, !dbg !439
  %call44 = call i32 @isdigit(i32 %conv43) #6, !dbg !442
  %tobool45 = icmp ne i32 %call44, 0, !dbg !442
  %88 = select i1 %tobool45, i64 35, i64 36, !dbg !443
  %89 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %88, !dbg !443
  %90 = load i64* %89, !dbg !443
  %91 = add i64 %90, 1, !dbg !443
  store i64 %91, i64* %89, !dbg !443
  br i1 %tobool45, label %land.lhs.true46, label %if.then50, !dbg !443

land.lhs.true46:                                  ; preds = %if.then41
  %92 = load i8** %input, align 8, !dbg !444
  %arrayidx47 = getelementptr inbounds i8* %92, i64 7, !dbg !444
  %93 = load i8* %arrayidx47, align 1, !dbg !444
  %conv48 = sext i8 %93 to i32, !dbg !444
  %cmp49 = icmp eq i32 %conv48, 0, !dbg !444
  %94 = select i1 %cmp49, i64 37, i64 38, !dbg !443
  %95 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %94, !dbg !443
  %96 = load i64* %95, !dbg !443
  %97 = add i64 %96, 1, !dbg !443
  store i64 %97, i64* %95, !dbg !443
  br i1 %cmp49, label %if.else52, label %if.then50, !dbg !443

if.then50:                                        ; preds = %land.lhs.true46, %if.then41
  %98 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 39), !dbg !446
  %99 = add i64 %98, 1, !dbg !446
  store i64 %99, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 39), !dbg !446
  %call51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([57 x i8]* @.str61, i32 0, i32 0)), !dbg !446
  br label %if.end56, !dbg !446

if.else52:                                        ; preds = %land.lhs.true46
  %100 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 40), !dbg !447
  %101 = add i64 %100, 1, !dbg !447
  store i64 %101, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 40), !dbg !447
  %102 = load i8** %input, align 8, !dbg !447
  %arrayidx53 = getelementptr inbounds i8* %102, i64 6, !dbg !447
  %103 = load i8* %arrayidx53, align 1, !dbg !447
  %conv54 = sext i8 %103 to i32, !dbg !447
  %sub55 = sub nsw i32 %conv54, 48, !dbg !447
  store i32 %sub55, i32* %level, align 4, !dbg !448
  br label %if.end56

if.end56:                                         ; preds = %if.else52, %if.then50
  %104 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 41), !dbg !449
  %105 = add i64 %104, 1, !dbg !449
  store i64 %105, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 41), !dbg !449
  br label %if.end487, !dbg !449

if.else57:                                        ; preds = %if.else38
  %106 = load i8** %input, align 8, !dbg !450
  %call58 = call i32 @strcasecmp(i8* getelementptr inbounds ([6 x i8]* @.str62, i32 0, i32 0), i8* %106) #11, !dbg !452
  %tobool59 = icmp ne i32 %call58, 0, !dbg !452
  %107 = select i1 %tobool59, i64 42, i64 43, !dbg !453
  %108 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %107, !dbg !453
  %109 = load i64* %108, !dbg !453
  %110 = add i64 %109, 1, !dbg !453
  store i64 %110, i64* %108, !dbg !453
  br i1 %tobool59, label %if.else62, label %if.then60, !dbg !453

if.then60:                                        ; preds = %if.else57
  %111 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 44), !dbg !454
  %112 = add i64 %111, 1, !dbg !454
  store i64 %112, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 44), !dbg !454
  %113 = load i32* %level, align 4, !dbg !454
  %call61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str63, i32 0, i32 0), i32 %113), !dbg !455
  br label %if.end486, !dbg !455

if.else62:                                        ; preds = %if.else57
  %114 = load i8** %input, align 8, !dbg !456
  %call63 = call i32 @strncasecmp(i8* getelementptr inbounds ([6 x i8]* @.str64, i32 0, i32 0), i8* %114, i64 5) #11, !dbg !458
  %tobool64 = icmp ne i32 %call63, 0, !dbg !458
  %115 = select i1 %tobool64, i64 45, i64 46, !dbg !459
  %116 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %115, !dbg !459
  %117 = load i64* %116, !dbg !459
  %118 = add i64 %117, 1, !dbg !459
  store i64 %118, i64* %116, !dbg !459
  br i1 %tobool64, label %if.else88, label %if.then65, !dbg !459

if.then65:                                        ; preds = %if.else62
  %119 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 47), !dbg !460
  %120 = add i64 %119, 1, !dbg !460
  store i64 %120, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 47), !dbg !460
  call void @llvm.dbg.declare(metadata i8** %cp, metadata !462, metadata !198), !dbg !460
  %121 = load i8** %input, align 8, !dbg !463
  %add.ptr = getelementptr inbounds i8* %121, i64 5, !dbg !463
  store i8* %add.ptr, i8** %cp, align 8, !dbg !460
  br label %while.cond, !dbg !464

while.cond:                                       ; preds = %while.body, %if.then65
  %122 = load i8** %cp, align 8, !dbg !465
  %123 = load i8* %122, align 1, !dbg !468
  %conv67 = sext i8 %123 to i32, !dbg !468
  %call68 = call i32 @isdigit(i32 %conv67) #6, !dbg !469
  %tobool69 = icmp ne i32 %call68, 0, !dbg !469
  %124 = select i1 %tobool69, i64 48, i64 49, !dbg !464
  %125 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %124, !dbg !464
  %126 = load i64* %125, !dbg !464
  %127 = add i64 %126, 1, !dbg !464
  store i64 %127, i64* %125, !dbg !464
  br i1 %tobool69, label %while.body, label %while.end, !dbg !464

while.body:                                       ; preds = %while.cond
  %128 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 50), !dbg !470
  %129 = add i64 %128, 1, !dbg !470
  store i64 %129, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 50), !dbg !470
  %130 = load i8** %cp, align 8, !dbg !470
  %incdec.ptr = getelementptr inbounds i8* %130, i32 1, !dbg !470
  store i8* %incdec.ptr, i8** %cp, align 8, !dbg !470
  br label %while.cond, !dbg !464

while.end:                                        ; preds = %while.cond
  %131 = load i8** %cp, align 8, !dbg !471
  %132 = load i8** %input, align 8, !dbg !473
  %add.ptr70 = getelementptr inbounds i8* %132, i64 5, !dbg !473
  %cmp71 = icmp eq i8* %131, %add.ptr70, !dbg !471
  %133 = select i1 %cmp71, i64 51, i64 52, !dbg !474
  %134 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %133, !dbg !474
  %135 = load i64* %134, !dbg !474
  %136 = add i64 %135, 1, !dbg !474
  store i64 %136, i64* %134, !dbg !474
  br i1 %cmp71, label %if.then82, label %lor.lhs.false72, !dbg !474

lor.lhs.false72:                                  ; preds = %while.end
  %137 = load i8** %cp, align 8, !dbg !475
  %138 = load i8* %137, align 1, !dbg !477
  %conv73 = sext i8 %138 to i32, !dbg !477
  %cmp74 = icmp ne i32 %conv73, 0, !dbg !477
  %139 = select i1 %cmp74, i64 53, i64 54, !dbg !474
  %140 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %139, !dbg !474
  %141 = load i64* %140, !dbg !474
  %142 = add i64 %141, 1, !dbg !474
  store i64 %142, i64* %140, !dbg !474
  br i1 %cmp74, label %land.lhs.true75, label %if.else84, !dbg !474

land.lhs.true75:                                  ; preds = %lor.lhs.false72
  %143 = load i8** %cp, align 8, !dbg !478
  %144 = load i8* %143, align 1, !dbg !480
  %conv76 = sext i8 %144 to i32, !dbg !480
  %cmp77 = icmp eq i32 %conv76, 32, !dbg !480
  %145 = select i1 %cmp77, i64 55, i64 56, !dbg !474
  %146 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %145, !dbg !474
  %147 = load i64* %146, !dbg !474
  %148 = add i64 %147, 1, !dbg !474
  store i64 %148, i64* %146, !dbg !474
  br i1 %cmp77, label %land.lhs.true78, label %if.then82, !dbg !474

land.lhs.true78:                                  ; preds = %land.lhs.true75
  %149 = load i8** %cp, align 8, !dbg !481
  %add.ptr79 = getelementptr inbounds i8* %149, i64 1, !dbg !481
  %150 = load i8* %add.ptr79, align 1, !dbg !483
  %conv80 = sext i8 %150 to i32, !dbg !483
  %cmp81 = icmp eq i32 %conv80, 0, !dbg !483
  %151 = select i1 %cmp81, i64 57, i64 58, !dbg !474
  %152 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %151, !dbg !474
  %153 = load i64* %152, !dbg !474
  %154 = add i64 %153, 1, !dbg !474
  store i64 %154, i64* %152, !dbg !474
  br i1 %cmp81, label %if.else84, label %if.then82, !dbg !474

if.then82:                                        ; preds = %land.lhs.true78, %land.lhs.true75, %while.end
  %155 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 59), !dbg !484
  %156 = add i64 %155, 1, !dbg !484
  store i64 %156, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 59), !dbg !484
  %call83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str65, i32 0, i32 0)), !dbg !484
  br label %if.end87, !dbg !484

if.else84:                                        ; preds = %land.lhs.true78, %lor.lhs.false72
  %157 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 60), !dbg !485
  %158 = add i64 %157, 1, !dbg !485
  store i64 %158, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 60), !dbg !485
  %159 = load i8** %input, align 8, !dbg !485
  %add.ptr85 = getelementptr inbounds i8* %159, i64 5, !dbg !485
  %call86 = call i32 @atoi(i8* %add.ptr85) #11, !dbg !486
  store i32 %call86, i32* %time, align 4, !dbg !487
  br label %if.end87

if.end87:                                         ; preds = %if.else84, %if.then82
  %160 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 61), !dbg !488
  %161 = add i64 %160, 1, !dbg !488
  store i64 %161, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 61), !dbg !488
  br label %if.end485, !dbg !488

if.else88:                                        ; preds = %if.else62
  %162 = load i8** %input, align 8, !dbg !489
  %call89 = call i32 @strcasecmp(i8* getelementptr inbounds ([5 x i8]* @.str66, i32 0, i32 0), i8* %162) #11, !dbg !491
  %tobool90 = icmp ne i32 %call89, 0, !dbg !491
  %163 = select i1 %tobool90, i64 62, i64 63, !dbg !492
  %164 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %163, !dbg !492
  %165 = load i64* %164, !dbg !492
  %166 = add i64 %165, 1, !dbg !492
  store i64 %166, i64* %164, !dbg !492
  br i1 %tobool90, label %if.else93, label %if.then91, !dbg !492

if.then91:                                        ; preds = %if.else88
  %167 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 64), !dbg !493
  %168 = add i64 %167, 1, !dbg !493
  store i64 %168, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 64), !dbg !493
  %169 = load i32* %time, align 4, !dbg !493
  %call92 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str67, i32 0, i32 0), i32 %169), !dbg !494
  br label %if.end484, !dbg !494

if.else93:                                        ; preds = %if.else88
  %170 = load i8** %input, align 8, !dbg !495
  %call94 = call i32 @strcasecmp(i8* getelementptr inbounds ([6 x i8]* @.str68, i32 0, i32 0), i8* %170) #11, !dbg !497
  %tobool95 = icmp ne i32 %call94, 0, !dbg !497
  %171 = select i1 %tobool95, i64 65, i64 66, !dbg !498
  %172 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %171, !dbg !498
  %173 = load i64* %172, !dbg !498
  %174 = add i64 %173, 1, !dbg !498
  store i64 %174, i64* %172, !dbg !498
  br i1 %tobool95, label %if.else97, label %if.then96, !dbg !498

if.then96:                                        ; preds = %if.else93
  %175 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 67), !dbg !499
  %176 = add i64 %175, 1, !dbg !499
  store i64 %176, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 67), !dbg !499
  %177 = load %class.HexxagonGame** %game, align 8, !dbg !499
  call void @_ZN12HexxagonGame11displayTextEv(%class.HexxagonGame* %177), !dbg !499
  br label %if.end483, !dbg !499

if.else97:                                        ; preds = %if.else93
  %178 = load i8** %input, align 8, !dbg !500
  %call98 = call i32 @strcasecmp(i8* getelementptr inbounds ([5 x i8]* @.str69, i32 0, i32 0), i8* %178) #11, !dbg !502
  %tobool99 = icmp ne i32 %call98, 0, !dbg !502
  %179 = select i1 %tobool99, i64 68, i64 69, !dbg !503
  %180 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %179, !dbg !503
  %181 = load i64* %180, !dbg !503
  %182 = add i64 %181, 1, !dbg !503
  store i64 %182, i64* %180, !dbg !503
  br i1 %tobool99, label %if.else107, label %if.then100, !dbg !503

if.then100:                                       ; preds = %if.else97
  %183 = load %class.HexxagonGame** %game, align 8, !dbg !504
  %call101 = call i32 @_ZN12HexxagonGame4prevEv(%class.HexxagonGame* %183), !dbg !504
  %tobool102 = icmp ne i32 %call101, 0, !dbg !504
  %184 = select i1 %tobool102, i64 70, i64 71, !dbg !507
  %185 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %184, !dbg !507
  %186 = load i64* %185, !dbg !507
  %187 = add i64 %186, 1, !dbg !507
  store i64 %187, i64* %185, !dbg !507
  br i1 %tobool102, label %if.then103, label %if.else105, !dbg !507

if.then103:                                       ; preds = %if.then100
  %188 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 72), !dbg !508
  %189 = add i64 %188, 1, !dbg !508
  store i64 %189, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 72), !dbg !508
  %call104 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str70, i32 0, i32 0)), !dbg !508
  br label %if.end106, !dbg !508

if.else105:                                       ; preds = %if.then100
  %190 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 73), !dbg !509
  %191 = add i64 %190, 1, !dbg !509
  store i64 %191, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 73), !dbg !509
  %192 = load %class.HexxagonGame** %game, align 8, !dbg !509
  call void @_ZN12HexxagonGame11displayTextEv(%class.HexxagonGame* %192), !dbg !509
  br label %if.end106

if.end106:                                        ; preds = %if.else105, %if.then103
  %193 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 74), !dbg !510
  %194 = add i64 %193, 1, !dbg !510
  store i64 %194, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 74), !dbg !510
  br label %if.end482, !dbg !510

if.else107:                                       ; preds = %if.else97
  %195 = load i8** %input, align 8, !dbg !511
  %call108 = call i32 @strcasecmp(i8* getelementptr inbounds ([5 x i8]* @.str71, i32 0, i32 0), i8* %195) #11, !dbg !513
  %tobool109 = icmp ne i32 %call108, 0, !dbg !513
  %196 = select i1 %tobool109, i64 75, i64 76, !dbg !514
  %197 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %196, !dbg !514
  %198 = load i64* %197, !dbg !514
  %199 = add i64 %198, 1, !dbg !514
  store i64 %199, i64* %197, !dbg !514
  br i1 %tobool109, label %if.else117, label %if.then110, !dbg !514

if.then110:                                       ; preds = %if.else107
  %200 = load %class.HexxagonGame** %game, align 8, !dbg !515
  %call111 = call i32 @_ZN12HexxagonGame4nextEv(%class.HexxagonGame* %200), !dbg !515
  %tobool112 = icmp ne i32 %call111, 0, !dbg !515
  %201 = select i1 %tobool112, i64 77, i64 78, !dbg !518
  %202 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %201, !dbg !518
  %203 = load i64* %202, !dbg !518
  %204 = add i64 %203, 1, !dbg !518
  store i64 %204, i64* %202, !dbg !518
  br i1 %tobool112, label %if.then113, label %if.else115, !dbg !518

if.then113:                                       ; preds = %if.then110
  %205 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 79), !dbg !519
  %206 = add i64 %205, 1, !dbg !519
  store i64 %206, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 79), !dbg !519
  %call114 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str72, i32 0, i32 0)), !dbg !519
  br label %if.end116, !dbg !519

if.else115:                                       ; preds = %if.then110
  %207 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 80), !dbg !520
  %208 = add i64 %207, 1, !dbg !520
  store i64 %208, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 80), !dbg !520
  %209 = load %class.HexxagonGame** %game, align 8, !dbg !520
  call void @_ZN12HexxagonGame11displayTextEv(%class.HexxagonGame* %209), !dbg !520
  br label %if.end116

if.end116:                                        ; preds = %if.else115, %if.then113
  %210 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 81), !dbg !521
  %211 = add i64 %210, 1, !dbg !521
  store i64 %211, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 81), !dbg !521
  br label %if.end481, !dbg !521

if.else117:                                       ; preds = %if.else107
  %212 = load i8** %input, align 8, !dbg !522
  %call118 = call i32 @strcasecmp(i8* getelementptr inbounds ([5 x i8]* @.str73, i32 0, i32 0), i8* %212) #11, !dbg !524
  %tobool119 = icmp ne i32 %call118, 0, !dbg !524
  %213 = select i1 %tobool119, i64 82, i64 83, !dbg !525
  %214 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %213, !dbg !525
  %215 = load i64* %214, !dbg !525
  %216 = add i64 %215, 1, !dbg !525
  store i64 %216, i64* %214, !dbg !525
  br i1 %tobool119, label %if.else127, label %if.then120, !dbg !525

if.then120:                                       ; preds = %if.else117
  %217 = load %class.HexxagonGame** %game, align 8, !dbg !526
  %218 = load i32* %level, align 4, !dbg !528
  %219 = load i32* %time, align 4, !dbg !529
  %mul = mul nsw i32 %219, 1000, !dbg !529
  %call121 = call i32 @_ZN12HexxagonGame12computerMoveEiPFvvEi(%class.HexxagonGame* %217, i32 %218, void ()* null, i32 %mul), !dbg !526
  %220 = load %class.HexxagonGame** %game, align 8, !dbg !530
  call void @_ZN12HexxagonGame11displayTextEv(%class.HexxagonGame* %220), !dbg !530
  %221 = load i32* %mode, align 4, !dbg !531
  %cmp122 = icmp ne i32 %221, 2, !dbg !531
  %222 = select i1 %cmp122, i64 84, i64 85, !dbg !533
  %223 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %222, !dbg !533
  %224 = load i64* %223, !dbg !533
  %225 = add i64 %224, 1, !dbg !533
  store i64 %225, i64* %223, !dbg !533
  br i1 %cmp122, label %if.then123, label %if.end126, !dbg !533

if.then123:                                       ; preds = %if.then120
  %226 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 86), !dbg !534
  %227 = add i64 %226, 1, !dbg !534
  store i64 %227, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 86), !dbg !534
  %228 = load %class.HexxagonGame** %game, align 8, !dbg !534
  %229 = load i32* %level, align 4, !dbg !536
  %230 = load i32* %time, align 4, !dbg !537
  %mul124 = mul nsw i32 %230, 1000, !dbg !537
  %call125 = call i32 @_ZN12HexxagonGame12computerMoveEiPFvvEi(%class.HexxagonGame* %228, i32 %229, void ()* null, i32 %mul124), !dbg !534
  %231 = load %class.HexxagonGame** %game, align 8, !dbg !538
  call void @_ZN12HexxagonGame11displayTextEv(%class.HexxagonGame* %231), !dbg !538
  br label %if.end126, !dbg !539

if.end126:                                        ; preds = %if.then123, %if.then120
  %232 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 87), !dbg !540
  %233 = add i64 %232, 1, !dbg !540
  store i64 %233, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 87), !dbg !540
  br label %if.end480, !dbg !540

if.else127:                                       ; preds = %if.else117
  %234 = load i8** %input, align 8, !dbg !541
  %call128 = call i32 @strncasecmp(i8* getelementptr inbounds ([6 x i8]* @.str74, i32 0, i32 0), i8* %234, i64 5) #11, !dbg !543
  %tobool129 = icmp ne i32 %call128, 0, !dbg !543
  %235 = select i1 %tobool129, i64 88, i64 89, !dbg !544
  %236 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %235, !dbg !544
  %237 = load i64* %236, !dbg !544
  %238 = add i64 %237, 1, !dbg !544
  store i64 %238, i64* %236, !dbg !544
  br i1 %tobool129, label %if.else150, label %if.then130, !dbg !544

if.then130:                                       ; preds = %if.else127
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !545, metadata !198), !dbg !547
  %239 = load %class.HexxagonGame** %game, align 8, !dbg !548
  %240 = load i8** %input, align 8, !dbg !549
  %add.ptr132 = getelementptr inbounds i8* %240, i64 5, !dbg !549
  %call133 = call i32 @_ZN12HexxagonGame8loadGameEPc(%class.HexxagonGame* %239, i8* %add.ptr132), !dbg !548
  store i32 %call133, i32* %ret, align 4, !dbg !547
  %241 = load i32* %ret, align 4, !dbg !550
  %cmp134 = icmp eq i32 %241, 0, !dbg !550
  %242 = select i1 %cmp134, i64 90, i64 91, !dbg !552
  %243 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %242, !dbg !552
  %244 = load i64* %243, !dbg !552
  %245 = add i64 %244, 1, !dbg !552
  store i64 %245, i64* %243, !dbg !552
  br i1 %cmp134, label %if.then135, label %if.else137, !dbg !552

if.then135:                                       ; preds = %if.then130
  %246 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 92), !dbg !553
  %247 = add i64 %246, 1, !dbg !553
  store i64 %247, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 92), !dbg !553
  %call136 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str75, i32 0, i32 0)), !dbg !553
  %248 = load %class.HexxagonGame** %game, align 8, !dbg !555
  call void @_ZN12HexxagonGame11displayTextEv(%class.HexxagonGame* %248), !dbg !555
  br label %if.end149, !dbg !556

if.else137:                                       ; preds = %if.then130
  %249 = load i32* %ret, align 4, !dbg !557
  %cmp138 = icmp eq i32 %249, -1, !dbg !557
  %250 = select i1 %cmp138, i64 93, i64 94, !dbg !559
  %251 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %250, !dbg !559
  %252 = load i64* %251, !dbg !559
  %253 = add i64 %252, 1, !dbg !559
  store i64 %253, i64* %251, !dbg !559
  br i1 %cmp138, label %if.then139, label %if.else141, !dbg !559

if.then139:                                       ; preds = %if.else137
  %254 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 95), !dbg !560
  %255 = add i64 %254, 1, !dbg !560
  store i64 %255, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 95), !dbg !560
  %call140 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str76, i32 0, i32 0)), !dbg !560
  br label %if.end148, !dbg !560

if.else141:                                       ; preds = %if.else137
  %256 = load i32* %ret, align 4, !dbg !561
  %cmp142 = icmp eq i32 %256, -3, !dbg !561
  %257 = select i1 %cmp142, i64 96, i64 97, !dbg !563
  %258 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %257, !dbg !563
  %259 = load i64* %258, !dbg !563
  %260 = add i64 %259, 1, !dbg !563
  store i64 %260, i64* %258, !dbg !563
  br i1 %cmp142, label %if.then143, label %if.else145, !dbg !563

if.then143:                                       ; preds = %if.else141
  %261 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 98), !dbg !564
  %262 = add i64 %261, 1, !dbg !564
  store i64 %262, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 98), !dbg !564
  %call144 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str77, i32 0, i32 0)), !dbg !564
  br label %if.end147, !dbg !564

if.else145:                                       ; preds = %if.else141
  %263 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 99), !dbg !565
  %264 = add i64 %263, 1, !dbg !565
  store i64 %264, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 99), !dbg !565
  %call146 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str78, i32 0, i32 0)), !dbg !565
  br label %if.end147

if.end147:                                        ; preds = %if.else145, %if.then143
  %265 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 100)
  %266 = add i64 %265, 1
  store i64 %266, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 100)
  br label %if.end148

if.end148:                                        ; preds = %if.end147, %if.then139
  %267 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 101)
  %268 = add i64 %267, 1
  store i64 %268, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 101)
  br label %if.end149

if.end149:                                        ; preds = %if.end148, %if.then135
  %269 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 102), !dbg !566
  %270 = add i64 %269, 1, !dbg !566
  store i64 %270, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 102), !dbg !566
  br label %if.end479, !dbg !566

if.else150:                                       ; preds = %if.else127
  %271 = load i8** %input, align 8, !dbg !567
  %call151 = call i32 @strcasecmp(i8* getelementptr inbounds ([5 x i8]* @.str79, i32 0, i32 0), i8* %271) #11, !dbg !569
  %tobool152 = icmp ne i32 %call151, 0, !dbg !569
  %272 = select i1 %tobool152, i64 103, i64 104, !dbg !570
  %273 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %272, !dbg !570
  %274 = load i64* %273, !dbg !570
  %275 = add i64 %274, 1, !dbg !570
  store i64 %275, i64* %273, !dbg !570
  br i1 %tobool152, label %if.else155, label %if.then153, !dbg !570

if.then153:                                       ; preds = %if.else150
  %276 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 105), !dbg !571
  %277 = add i64 %276, 1, !dbg !571
  store i64 %277, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 105), !dbg !571
  %call154 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str80, i32 0, i32 0)), !dbg !571
  br label %if.end478, !dbg !571

if.else155:                                       ; preds = %if.else150
  %278 = load i8** %input, align 8, !dbg !572
  %call156 = call i32 @strncasecmp(i8* getelementptr inbounds ([6 x i8]* @.str81, i32 0, i32 0), i8* %278, i64 5) #11, !dbg !574
  %tobool157 = icmp ne i32 %call156, 0, !dbg !574
  %279 = select i1 %tobool157, i64 106, i64 107, !dbg !575
  %280 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %279, !dbg !575
  %281 = load i64* %280, !dbg !575
  %282 = add i64 %281, 1, !dbg !575
  store i64 %282, i64* %280, !dbg !575
  br i1 %tobool157, label %if.else174, label %if.then158, !dbg !575

if.then158:                                       ; preds = %if.else155
  call void @llvm.dbg.declare(metadata i32* %ret160, metadata !576, metadata !198), !dbg !578
  %283 = load %class.HexxagonGame** %game, align 8, !dbg !579
  %284 = load i8** %input, align 8, !dbg !580
  %add.ptr161 = getelementptr inbounds i8* %284, i64 5, !dbg !580
  %call162 = call i32 @_ZN12HexxagonGame8saveGameEPc(%class.HexxagonGame* %283, i8* %add.ptr161), !dbg !579
  store i32 %call162, i32* %ret160, align 4, !dbg !578
  %285 = load i32* %ret160, align 4, !dbg !581
  %cmp163 = icmp eq i32 %285, 0, !dbg !581
  %286 = select i1 %cmp163, i64 108, i64 109, !dbg !583
  %287 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %286, !dbg !583
  %288 = load i64* %287, !dbg !583
  %289 = add i64 %288, 1, !dbg !583
  store i64 %289, i64* %287, !dbg !583
  br i1 %cmp163, label %if.then164, label %if.else166, !dbg !583

if.then164:                                       ; preds = %if.then158
  %290 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 110), !dbg !584
  %291 = add i64 %290, 1, !dbg !584
  store i64 %291, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 110), !dbg !584
  %call165 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str82, i32 0, i32 0)), !dbg !584
  br label %if.end173, !dbg !584

if.else166:                                       ; preds = %if.then158
  %292 = load i32* %ret160, align 4, !dbg !585
  %cmp167 = icmp eq i32 %292, -1, !dbg !585
  %293 = select i1 %cmp167, i64 111, i64 112, !dbg !587
  %294 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %293, !dbg !587
  %295 = load i64* %294, !dbg !587
  %296 = add i64 %295, 1, !dbg !587
  store i64 %296, i64* %294, !dbg !587
  br i1 %cmp167, label %if.then168, label %if.else170, !dbg !587

if.then168:                                       ; preds = %if.else166
  %297 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 113), !dbg !588
  %298 = add i64 %297, 1, !dbg !588
  store i64 %298, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 113), !dbg !588
  %call169 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str83, i32 0, i32 0)), !dbg !588
  br label %if.end172, !dbg !588

if.else170:                                       ; preds = %if.else166
  %299 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 114), !dbg !589
  %300 = add i64 %299, 1, !dbg !589
  store i64 %300, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 114), !dbg !589
  %call171 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str84, i32 0, i32 0)), !dbg !589
  br label %if.end172

if.end172:                                        ; preds = %if.else170, %if.then168
  %301 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 115)
  %302 = add i64 %301, 1
  store i64 %302, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 115)
  br label %if.end173

if.end173:                                        ; preds = %if.end172, %if.then164
  %303 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 116), !dbg !590
  %304 = add i64 %303, 1, !dbg !590
  store i64 %304, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 116), !dbg !590
  br label %if.end477, !dbg !590

if.else174:                                       ; preds = %if.else155
  %305 = load i8** %input, align 8, !dbg !591
  %call175 = call i32 @strcasecmp(i8* getelementptr inbounds ([5 x i8]* @.str85, i32 0, i32 0), i8* %305) #11, !dbg !593
  %tobool176 = icmp ne i32 %call175, 0, !dbg !593
  %306 = select i1 %tobool176, i64 117, i64 118, !dbg !594
  %307 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %306, !dbg !594
  %308 = load i64* %307, !dbg !594
  %309 = add i64 %308, 1, !dbg !594
  store i64 %309, i64* %307, !dbg !594
  br i1 %tobool176, label %if.else179, label %if.then177, !dbg !594

if.then177:                                       ; preds = %if.else174
  %310 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 119), !dbg !595
  %311 = add i64 %310, 1, !dbg !595
  store i64 %311, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 119), !dbg !595
  %call178 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str86, i32 0, i32 0)), !dbg !595
  br label %if.end476, !dbg !595

if.else179:                                       ; preds = %if.else174
  %312 = load i8** %input, align 8, !dbg !596
  %call180 = call i32 @strncasecmp(i8* getelementptr inbounds ([9 x i8]* @.str87, i32 0, i32 0), i8* %312, i64 8) #11, !dbg !598
  %tobool181 = icmp ne i32 %call180, 0, !dbg !598
  %313 = select i1 %tobool181, i64 120, i64 121, !dbg !599
  %314 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %313, !dbg !599
  %315 = load i64* %314, !dbg !599
  %316 = add i64 %315, 1, !dbg !599
  store i64 %316, i64* %314, !dbg !599
  br i1 %tobool181, label %if.else317, label %if.then182, !dbg !599

if.then182:                                       ; preds = %if.else179
  %317 = load i8** %input, align 8, !dbg !600
  %arrayidx183 = getelementptr inbounds i8* %317, i64 8, !dbg !600
  %318 = load i8* %arrayidx183, align 1, !dbg !600
  %conv184 = sext i8 %318 to i32, !dbg !600
  %cmp185 = icmp eq i32 %conv184, 99, !dbg !600
  %319 = select i1 %cmp185, i64 122, i64 123, !dbg !603
  %320 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %319, !dbg !603
  %321 = load i64* %320, !dbg !603
  %322 = add i64 %321, 1, !dbg !603
  store i64 %322, i64* %320, !dbg !603
  br i1 %cmp185, label %land.lhs.true198, label %lor.lhs.false186, !dbg !603

lor.lhs.false186:                                 ; preds = %if.then182
  %323 = load i8** %input, align 8, !dbg !604
  %arrayidx187 = getelementptr inbounds i8* %323, i64 8, !dbg !604
  %324 = load i8* %arrayidx187, align 1, !dbg !604
  %conv188 = sext i8 %324 to i32, !dbg !604
  %cmp189 = icmp eq i32 %conv188, 67, !dbg !604
  %325 = select i1 %cmp189, i64 124, i64 125, !dbg !603
  %326 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %325, !dbg !603
  %327 = load i64* %326, !dbg !603
  %328 = add i64 %327, 1, !dbg !603
  store i64 %328, i64* %326, !dbg !603
  br i1 %cmp189, label %land.lhs.true198, label %lor.lhs.false190, !dbg !603

lor.lhs.false190:                                 ; preds = %lor.lhs.false186
  %329 = load i8** %input, align 8, !dbg !606
  %arrayidx191 = getelementptr inbounds i8* %329, i64 8, !dbg !606
  %330 = load i8* %arrayidx191, align 1, !dbg !606
  %conv192 = sext i8 %330 to i32, !dbg !606
  %cmp193 = icmp eq i32 %conv192, 104, !dbg !606
  %331 = select i1 %cmp193, i64 126, i64 127, !dbg !603
  %332 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %331, !dbg !603
  %333 = load i64* %332, !dbg !603
  %334 = add i64 %333, 1, !dbg !603
  store i64 %334, i64* %332, !dbg !603
  br i1 %cmp193, label %land.lhs.true198, label %lor.lhs.false194, !dbg !603

lor.lhs.false194:                                 ; preds = %lor.lhs.false190
  %335 = load i8** %input, align 8, !dbg !608
  %arrayidx195 = getelementptr inbounds i8* %335, i64 8, !dbg !608
  %336 = load i8* %arrayidx195, align 1, !dbg !608
  %conv196 = sext i8 %336 to i32, !dbg !608
  %cmp197 = icmp eq i32 %conv196, 72, !dbg !608
  %337 = select i1 %cmp197, i64 128, i64 129, !dbg !603
  %338 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %337, !dbg !603
  %339 = load i64* %338, !dbg !603
  %340 = add i64 %339, 1, !dbg !603
  store i64 %340, i64* %338, !dbg !603
  br i1 %cmp197, label %land.lhs.true198, label %if.else314, !dbg !603

land.lhs.true198:                                 ; preds = %lor.lhs.false194, %lor.lhs.false190, %lor.lhs.false186, %if.then182
  %341 = load i8** %input, align 8, !dbg !610
  %arrayidx199 = getelementptr inbounds i8* %341, i64 9, !dbg !610
  %342 = load i8* %arrayidx199, align 1, !dbg !610
  %conv200 = sext i8 %342 to i32, !dbg !610
  %cmp201 = icmp eq i32 %conv200, 99, !dbg !610
  %343 = select i1 %cmp201, i64 130, i64 131, !dbg !603
  %344 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %343, !dbg !603
  %345 = load i64* %344, !dbg !603
  %346 = add i64 %345, 1, !dbg !603
  store i64 %346, i64* %344, !dbg !603
  br i1 %cmp201, label %land.lhs.true214, label %lor.lhs.false202, !dbg !603

lor.lhs.false202:                                 ; preds = %land.lhs.true198
  %347 = load i8** %input, align 8, !dbg !611
  %arrayidx203 = getelementptr inbounds i8* %347, i64 9, !dbg !611
  %348 = load i8* %arrayidx203, align 1, !dbg !611
  %conv204 = sext i8 %348 to i32, !dbg !611
  %cmp205 = icmp eq i32 %conv204, 67, !dbg !611
  %349 = select i1 %cmp205, i64 132, i64 133, !dbg !603
  %350 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %349, !dbg !603
  %351 = load i64* %350, !dbg !603
  %352 = add i64 %351, 1, !dbg !603
  store i64 %352, i64* %350, !dbg !603
  br i1 %cmp205, label %land.lhs.true214, label %lor.lhs.false206, !dbg !603

lor.lhs.false206:                                 ; preds = %lor.lhs.false202
  %353 = load i8** %input, align 8, !dbg !612
  %arrayidx207 = getelementptr inbounds i8* %353, i64 9, !dbg !612
  %354 = load i8* %arrayidx207, align 1, !dbg !612
  %conv208 = sext i8 %354 to i32, !dbg !612
  %cmp209 = icmp eq i32 %conv208, 104, !dbg !612
  %355 = select i1 %cmp209, i64 134, i64 135, !dbg !603
  %356 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %355, !dbg !603
  %357 = load i64* %356, !dbg !603
  %358 = add i64 %357, 1, !dbg !603
  store i64 %358, i64* %356, !dbg !603
  br i1 %cmp209, label %land.lhs.true214, label %lor.lhs.false210, !dbg !603

lor.lhs.false210:                                 ; preds = %lor.lhs.false206
  %359 = load i8** %input, align 8, !dbg !613
  %arrayidx211 = getelementptr inbounds i8* %359, i64 8, !dbg !613
  %360 = load i8* %arrayidx211, align 1, !dbg !613
  %conv212 = sext i8 %360 to i32, !dbg !613
  %cmp213 = icmp eq i32 %conv212, 57, !dbg !613
  %361 = select i1 %cmp213, i64 136, i64 137, !dbg !603
  %362 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %361, !dbg !603
  %363 = load i64* %362, !dbg !603
  %364 = add i64 %363, 1, !dbg !603
  store i64 %364, i64* %362, !dbg !603
  br i1 %cmp213, label %land.lhs.true214, label %if.else314, !dbg !603

land.lhs.true214:                                 ; preds = %lor.lhs.false210, %lor.lhs.false206, %lor.lhs.false202, %land.lhs.true198
  %365 = load i8** %input, align 8, !dbg !614
  %arrayidx215 = getelementptr inbounds i8* %365, i64 10, !dbg !614
  %366 = load i8* %arrayidx215, align 1, !dbg !614
  %conv216 = sext i8 %366 to i32, !dbg !614
  %cmp217 = icmp eq i32 %conv216, 0, !dbg !614
  %367 = select i1 %cmp217, i64 138, i64 139, !dbg !603
  %368 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %367, !dbg !603
  %369 = load i64* %368, !dbg !603
  %370 = add i64 %369, 1, !dbg !603
  store i64 %370, i64* %368, !dbg !603
  br i1 %cmp217, label %if.then226, label %lor.lhs.false218, !dbg !603

lor.lhs.false218:                                 ; preds = %land.lhs.true214
  %371 = load i8** %input, align 8, !dbg !615
  %arrayidx219 = getelementptr inbounds i8* %371, i64 10, !dbg !615
  %372 = load i8* %arrayidx219, align 1, !dbg !615
  %conv220 = sext i8 %372 to i32, !dbg !615
  %cmp221 = icmp eq i32 %conv220, 32, !dbg !615
  %373 = select i1 %cmp221, i64 140, i64 141, !dbg !603
  %374 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %373, !dbg !603
  %375 = load i64* %374, !dbg !603
  %376 = add i64 %375, 1, !dbg !603
  store i64 %376, i64* %374, !dbg !603
  br i1 %cmp221, label %land.lhs.true222, label %if.else314, !dbg !603

land.lhs.true222:                                 ; preds = %lor.lhs.false218
  %377 = load i8** %input, align 8, !dbg !616
  %arrayidx223 = getelementptr inbounds i8* %377, i64 11, !dbg !616
  %378 = load i8* %arrayidx223, align 1, !dbg !616
  %conv224 = sext i8 %378 to i32, !dbg !616
  %cmp225 = icmp eq i32 %conv224, 0, !dbg !616
  %379 = select i1 %cmp225, i64 142, i64 143, !dbg !603
  %380 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %379, !dbg !603
  %381 = load i64* %380, !dbg !603
  %382 = add i64 %381, 1, !dbg !603
  store i64 %382, i64* %380, !dbg !603
  br i1 %cmp225, label %if.then226, label %if.else314, !dbg !603

if.then226:                                       ; preds = %land.lhs.true222, %land.lhs.true214
  %383 = load %class.HexxagonGame** %game, align 8, !dbg !617
  %isnull = icmp eq %class.HexxagonGame* %383, null, !dbg !619
  %384 = select i1 %isnull, i64 144, i64 145, !dbg !619
  %385 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %384, !dbg !619
  %386 = load i64* %385, !dbg !619
  %387 = add i64 %386, 1, !dbg !619
  store i64 %387, i64* %385, !dbg !619
  br i1 %isnull, label %delete.end, label %delete.notnull, !dbg !619

delete.notnull:                                   ; preds = %if.then226
  store i32 1, i32* @__llvm_gcov_global_state_pred, !dbg !620
  invoke void @_ZN12HexxagonGameD2Ev(%class.HexxagonGame* %383)
          to label %invoke.cont228 unwind label %lpad227, !dbg !620

invoke.cont228:                                   ; preds = %delete.notnull
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred, i64** getelementptr inbounds ([18 x i64*]* @__llvm_gcda_edge_table, i64 0, i64 6)), !dbg !622
  %388 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 148), !dbg !622
  %389 = add i64 %388, 1, !dbg !622
  store i64 %389, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 148), !dbg !622
  %390 = bitcast %class.HexxagonGame* %383 to i8*, !dbg !622
  call void @_ZdlPv(i8* %390) #12, !dbg !622
  br label %delete.end, !dbg !622

delete.end:                                       ; preds = %invoke.cont228, %if.then226
  store i32 2, i32* @__llvm_gcov_global_state_pred, !dbg !624
  %call229 = call noalias i8* @_Znwm(i64 24) #10, !dbg !624
  %391 = bitcast i8* %call229 to %class.HexxagonGame*, !dbg !624
  invoke void @_ZN12HexxagonGameC1Ev(%class.HexxagonGame* %391)
          to label %invoke.cont231 unwind label %lpad230, !dbg !624

invoke.cont231:                                   ; preds = %delete.end
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred, i64** getelementptr inbounds ([18 x i64*]* @__llvm_gcda_edge_table, i64 0, i64 12)), !dbg !625
  store %class.HexxagonGame* %391, %class.HexxagonGame** %game, align 8, !dbg !625
  %392 = load %class.HexxagonGame** %game, align 8, !dbg !626
  call void @_ZN12HexxagonGame11displayTextEv(%class.HexxagonGame* %392), !dbg !626
  %393 = load i8** %input, align 8, !dbg !627
  %arrayidx232 = getelementptr inbounds i8* %393, i64 8, !dbg !627
  %394 = load i8* %arrayidx232, align 1, !dbg !627
  %conv233 = sext i8 %394 to i32, !dbg !627
  %cmp234 = icmp eq i32 %conv233, 104, !dbg !627
  %395 = select i1 %cmp234, i64 151, i64 152, !dbg !629
  %396 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %395, !dbg !629
  %397 = load i64* %396, !dbg !629
  %398 = add i64 %397, 1, !dbg !629
  store i64 %398, i64* %396, !dbg !629
  br i1 %cmp234, label %land.lhs.true239, label %lor.lhs.false235, !dbg !629

lor.lhs.false235:                                 ; preds = %invoke.cont231
  %399 = load i8** %input, align 8, !dbg !630
  %arrayidx236 = getelementptr inbounds i8* %399, i64 8, !dbg !630
  %400 = load i8* %arrayidx236, align 1, !dbg !630
  %conv237 = sext i8 %400 to i32, !dbg !630
  %cmp238 = icmp eq i32 %conv237, 72, !dbg !630
  %401 = select i1 %cmp238, i64 153, i64 154, !dbg !629
  %402 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %401, !dbg !629
  %403 = load i64* %402, !dbg !629
  %404 = add i64 %403, 1, !dbg !629
  store i64 %404, i64* %402, !dbg !629
  br i1 %cmp238, label %land.lhs.true239, label %if.else248, !dbg !629

land.lhs.true239:                                 ; preds = %lor.lhs.false235, %invoke.cont231
  %405 = load i8** %input, align 8, !dbg !632
  %arrayidx240 = getelementptr inbounds i8* %405, i64 9, !dbg !632
  %406 = load i8* %arrayidx240, align 1, !dbg !632
  %conv241 = sext i8 %406 to i32, !dbg !632
  %cmp242 = icmp eq i32 %conv241, 99, !dbg !632
  %407 = select i1 %cmp242, i64 155, i64 156, !dbg !629
  %408 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %407, !dbg !629
  %409 = load i64* %408, !dbg !629
  %410 = add i64 %409, 1, !dbg !629
  store i64 %410, i64* %408, !dbg !629
  br i1 %cmp242, label %if.then247, label %lor.lhs.false243, !dbg !629

lor.lhs.false243:                                 ; preds = %land.lhs.true239
  %411 = load i8** %input, align 8, !dbg !633
  %arrayidx244 = getelementptr inbounds i8* %411, i64 9, !dbg !633
  %412 = load i8* %arrayidx244, align 1, !dbg !633
  %conv245 = sext i8 %412 to i32, !dbg !633
  %cmp246 = icmp eq i32 %conv245, 67, !dbg !633
  %413 = select i1 %cmp246, i64 157, i64 158, !dbg !629
  %414 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %413, !dbg !629
  %415 = load i64* %414, !dbg !629
  %416 = add i64 %415, 1, !dbg !629
  store i64 %416, i64* %414, !dbg !629
  br i1 %cmp246, label %if.then247, label %if.else248, !dbg !629

if.then247:                                       ; preds = %lor.lhs.false243, %land.lhs.true239
  %417 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 159), !dbg !634
  %418 = add i64 %417, 1, !dbg !634
  store i64 %418, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 159), !dbg !634
  store i32 1, i32* %mode, align 4, !dbg !634
  br label %if.end313, !dbg !634

lpad227:                                          ; preds = %delete.notnull
  %419 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !635
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred, i64** getelementptr inbounds ([18 x i64*]* @__llvm_gcda_edge_table, i64 0, i64 9)), !dbg !635
  %420 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 160), !dbg !635
  %421 = add i64 %420, 1, !dbg !635
  store i64 %421, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 160), !dbg !635
  %422 = extractvalue { i8*, i32 } %419, 0, !dbg !635
  store i8* %422, i8** %exn.slot, !dbg !635
  %423 = extractvalue { i8*, i32 } %419, 1, !dbg !635
  store i32 %423, i32* %ehselector.slot, !dbg !635
  %424 = bitcast %class.HexxagonGame* %383 to i8*, !dbg !635
  call void @_ZdlPv(i8* %424) #12, !dbg !635
  br label %eh.resume, !dbg !635

lpad230:                                          ; preds = %delete.end
  %425 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !635
  call void @__llvm_gcov_indirect_counter_increment(i32* @__llvm_gcov_global_state_pred, i64** getelementptr inbounds ([18 x i64*]* @__llvm_gcda_edge_table, i64 0, i64 15)), !dbg !635
  %426 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 161), !dbg !635
  %427 = add i64 %426, 1, !dbg !635
  store i64 %427, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 161), !dbg !635
  %428 = extractvalue { i8*, i32 } %425, 0, !dbg !635
  store i8* %428, i8** %exn.slot, !dbg !635
  %429 = extractvalue { i8*, i32 } %425, 1, !dbg !635
  store i32 %429, i32* %ehselector.slot, !dbg !635
  call void @_ZdlPv(i8* %call229) #12, !dbg !635
  br label %eh.resume, !dbg !635

if.else248:                                       ; preds = %lor.lhs.false243, %lor.lhs.false235
  %430 = load i8** %input, align 8, !dbg !636
  %arrayidx249 = getelementptr inbounds i8* %430, i64 8, !dbg !636
  %431 = load i8* %arrayidx249, align 1, !dbg !636
  %conv250 = sext i8 %431 to i32, !dbg !636
  %cmp251 = icmp eq i32 %conv250, 99, !dbg !636
  %432 = select i1 %cmp251, i64 162, i64 163, !dbg !638
  %433 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %432, !dbg !638
  %434 = load i64* %433, !dbg !638
  %435 = add i64 %434, 1, !dbg !638
  store i64 %435, i64* %433, !dbg !638
  br i1 %cmp251, label %land.lhs.true256, label %lor.lhs.false252, !dbg !638

lor.lhs.false252:                                 ; preds = %if.else248
  %436 = load i8** %input, align 8, !dbg !639
  %arrayidx253 = getelementptr inbounds i8* %436, i64 8, !dbg !639
  %437 = load i8* %arrayidx253, align 1, !dbg !639
  %conv254 = sext i8 %437 to i32, !dbg !639
  %cmp255 = icmp eq i32 %conv254, 67, !dbg !639
  %438 = select i1 %cmp255, i64 164, i64 165, !dbg !638
  %439 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %438, !dbg !638
  %440 = load i64* %439, !dbg !638
  %441 = add i64 %440, 1, !dbg !638
  store i64 %441, i64* %439, !dbg !638
  br i1 %cmp255, label %land.lhs.true256, label %if.else267, !dbg !638

land.lhs.true256:                                 ; preds = %lor.lhs.false252, %if.else248
  %442 = load i8** %input, align 8, !dbg !641
  %arrayidx257 = getelementptr inbounds i8* %442, i64 9, !dbg !641
  %443 = load i8* %arrayidx257, align 1, !dbg !641
  %conv258 = sext i8 %443 to i32, !dbg !641
  %cmp259 = icmp eq i32 %conv258, 104, !dbg !641
  %444 = select i1 %cmp259, i64 166, i64 167, !dbg !638
  %445 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %444, !dbg !638
  %446 = load i64* %445, !dbg !638
  %447 = add i64 %446, 1, !dbg !638
  store i64 %447, i64* %445, !dbg !638
  br i1 %cmp259, label %if.then264, label %lor.lhs.false260, !dbg !638

lor.lhs.false260:                                 ; preds = %land.lhs.true256
  %448 = load i8** %input, align 8, !dbg !642
  %arrayidx261 = getelementptr inbounds i8* %448, i64 9, !dbg !642
  %449 = load i8* %arrayidx261, align 1, !dbg !642
  %conv262 = sext i8 %449 to i32, !dbg !642
  %cmp263 = icmp eq i32 %conv262, 72, !dbg !642
  %450 = select i1 %cmp263, i64 168, i64 169, !dbg !638
  %451 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %450, !dbg !638
  %452 = load i64* %451, !dbg !638
  %453 = add i64 %452, 1, !dbg !638
  store i64 %453, i64* %451, !dbg !638
  br i1 %cmp263, label %if.then264, label %if.else267, !dbg !638

if.then264:                                       ; preds = %lor.lhs.false260, %land.lhs.true256
  %454 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 170), !dbg !643
  %455 = add i64 %454, 1, !dbg !643
  store i64 %455, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 170), !dbg !643
  %456 = load %class.HexxagonGame** %game, align 8, !dbg !643
  %457 = load i32* %level, align 4, !dbg !645
  %458 = load i32* %time, align 4, !dbg !646
  %mul265 = mul nsw i32 %458, 1000, !dbg !646
  %call266 = call i32 @_ZN12HexxagonGame12computerMoveEiPFvvEi(%class.HexxagonGame* %456, i32 %457, void ()* null, i32 %mul265), !dbg !643
  %459 = load %class.HexxagonGame** %game, align 8, !dbg !647
  call void @_ZN12HexxagonGame11displayTextEv(%class.HexxagonGame* %459), !dbg !647
  store i32 1, i32* %mode, align 4, !dbg !648
  br label %if.end312, !dbg !649

if.else267:                                       ; preds = %lor.lhs.false260, %lor.lhs.false252
  %460 = load i8** %input, align 8, !dbg !650
  %arrayidx268 = getelementptr inbounds i8* %460, i64 8, !dbg !650
  %461 = load i8* %arrayidx268, align 1, !dbg !650
  %conv269 = sext i8 %461 to i32, !dbg !650
  %cmp270 = icmp eq i32 %conv269, 104, !dbg !650
  %462 = select i1 %cmp270, i64 171, i64 172, !dbg !652
  %463 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %462, !dbg !652
  %464 = load i64* %463, !dbg !652
  %465 = add i64 %464, 1, !dbg !652
  store i64 %465, i64* %463, !dbg !652
  br i1 %cmp270, label %land.lhs.true275, label %lor.lhs.false271, !dbg !652

lor.lhs.false271:                                 ; preds = %if.else267
  %466 = load i8** %input, align 8, !dbg !653
  %arrayidx272 = getelementptr inbounds i8* %466, i64 8, !dbg !653
  %467 = load i8* %arrayidx272, align 1, !dbg !653
  %conv273 = sext i8 %467 to i32, !dbg !653
  %cmp274 = icmp eq i32 %conv273, 72, !dbg !653
  %468 = select i1 %cmp274, i64 173, i64 174, !dbg !652
  %469 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %468, !dbg !652
  %470 = load i64* %469, !dbg !652
  %471 = add i64 %470, 1, !dbg !652
  store i64 %471, i64* %469, !dbg !652
  br i1 %cmp274, label %land.lhs.true275, label %if.else284, !dbg !652

land.lhs.true275:                                 ; preds = %lor.lhs.false271, %if.else267
  %472 = load i8** %input, align 8, !dbg !655
  %arrayidx276 = getelementptr inbounds i8* %472, i64 9, !dbg !655
  %473 = load i8* %arrayidx276, align 1, !dbg !655
  %conv277 = sext i8 %473 to i32, !dbg !655
  %cmp278 = icmp eq i32 %conv277, 104, !dbg !655
  %474 = select i1 %cmp278, i64 175, i64 176, !dbg !652
  %475 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %474, !dbg !652
  %476 = load i64* %475, !dbg !652
  %477 = add i64 %476, 1, !dbg !652
  store i64 %477, i64* %475, !dbg !652
  br i1 %cmp278, label %if.then283, label %lor.lhs.false279, !dbg !652

lor.lhs.false279:                                 ; preds = %land.lhs.true275
  %478 = load i8** %input, align 8, !dbg !656
  %arrayidx280 = getelementptr inbounds i8* %478, i64 9, !dbg !656
  %479 = load i8* %arrayidx280, align 1, !dbg !656
  %conv281 = sext i8 %479 to i32, !dbg !656
  %cmp282 = icmp eq i32 %conv281, 72, !dbg !656
  %480 = select i1 %cmp282, i64 177, i64 178, !dbg !652
  %481 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %480, !dbg !652
  %482 = load i64* %481, !dbg !652
  %483 = add i64 %482, 1, !dbg !652
  store i64 %483, i64* %481, !dbg !652
  br i1 %cmp282, label %if.then283, label %if.else284, !dbg !652

if.then283:                                       ; preds = %lor.lhs.false279, %land.lhs.true275
  %484 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 179), !dbg !657
  %485 = add i64 %484, 1, !dbg !657
  store i64 %485, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 179), !dbg !657
  store i32 2, i32* %mode, align 4, !dbg !657
  br label %if.end311, !dbg !657

if.else284:                                       ; preds = %lor.lhs.false279, %lor.lhs.false271
  %486 = load i8** %input, align 8, !dbg !658
  %arrayidx285 = getelementptr inbounds i8* %486, i64 8, !dbg !658
  %487 = load i8* %arrayidx285, align 1, !dbg !658
  %conv286 = sext i8 %487 to i32, !dbg !658
  %cmp287 = icmp eq i32 %conv286, 99, !dbg !658
  %488 = select i1 %cmp287, i64 180, i64 181, !dbg !660
  %489 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %488, !dbg !660
  %490 = load i64* %489, !dbg !660
  %491 = add i64 %490, 1, !dbg !660
  store i64 %491, i64* %489, !dbg !660
  br i1 %cmp287, label %land.lhs.true292, label %lor.lhs.false288, !dbg !660

lor.lhs.false288:                                 ; preds = %if.else284
  %492 = load i8** %input, align 8, !dbg !661
  %arrayidx289 = getelementptr inbounds i8* %492, i64 8, !dbg !661
  %493 = load i8* %arrayidx289, align 1, !dbg !661
  %conv290 = sext i8 %493 to i32, !dbg !661
  %cmp291 = icmp eq i32 %conv290, 67, !dbg !661
  %494 = select i1 %cmp291, i64 182, i64 183, !dbg !660
  %495 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %494, !dbg !660
  %496 = load i64* %495, !dbg !660
  %497 = add i64 %496, 1, !dbg !660
  store i64 %497, i64* %495, !dbg !660
  br i1 %cmp291, label %land.lhs.true292, label %if.else308, !dbg !660

land.lhs.true292:                                 ; preds = %lor.lhs.false288, %if.else284
  %498 = load i8** %input, align 8, !dbg !663
  %arrayidx293 = getelementptr inbounds i8* %498, i64 9, !dbg !663
  %499 = load i8* %arrayidx293, align 1, !dbg !663
  %conv294 = sext i8 %499 to i32, !dbg !663
  %cmp295 = icmp eq i32 %conv294, 99, !dbg !663
  %500 = select i1 %cmp295, i64 184, i64 185, !dbg !660
  %501 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %500, !dbg !660
  %502 = load i64* %501, !dbg !660
  %503 = add i64 %502, 1, !dbg !660
  store i64 %503, i64* %501, !dbg !660
  br i1 %cmp295, label %if.then300, label %lor.lhs.false296, !dbg !660

lor.lhs.false296:                                 ; preds = %land.lhs.true292
  %504 = load i8** %input, align 8, !dbg !664
  %arrayidx297 = getelementptr inbounds i8* %504, i64 9, !dbg !664
  %505 = load i8* %arrayidx297, align 1, !dbg !664
  %conv298 = sext i8 %505 to i32, !dbg !664
  %cmp299 = icmp eq i32 %conv298, 67, !dbg !664
  %506 = select i1 %cmp299, i64 186, i64 187, !dbg !660
  %507 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %506, !dbg !660
  %508 = load i64* %507, !dbg !660
  %509 = add i64 %508, 1, !dbg !660
  store i64 %509, i64* %507, !dbg !660
  br i1 %cmp299, label %if.then300, label %if.else308, !dbg !660

if.then300:                                       ; preds = %lor.lhs.false296, %land.lhs.true292
  %510 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 188), !dbg !665
  %511 = add i64 %510, 1, !dbg !665
  store i64 %511, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 188), !dbg !665
  br label %while.cond301, !dbg !665

while.cond301:                                    ; preds = %while.body304, %if.then300
  %512 = load %class.HexxagonGame** %game, align 8, !dbg !667
  %call302 = call i32 @_ZN12HexxagonGame9endOfGameEv(%class.HexxagonGame* %512), !dbg !667
  %tobool303 = icmp ne i32 %call302, 0, !dbg !667
  %lnot = xor i1 %tobool303, true, !dbg !670
  %513 = select i1 %lnot, i64 189, i64 190, !dbg !665
  %514 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %513, !dbg !665
  %515 = load i64* %514, !dbg !665
  %516 = add i64 %515, 1, !dbg !665
  store i64 %516, i64* %514, !dbg !665
  br i1 %lnot, label %while.body304, label %while.end307, !dbg !665

while.body304:                                    ; preds = %while.cond301
  %517 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 191), !dbg !671
  %518 = add i64 %517, 1, !dbg !671
  store i64 %518, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 191), !dbg !671
  %519 = load %class.HexxagonGame** %game, align 8, !dbg !671
  %520 = load i32* %level, align 4, !dbg !673
  %521 = load i32* %time, align 4, !dbg !674
  %mul305 = mul nsw i32 %521, 1000, !dbg !674
  %call306 = call i32 @_ZN12HexxagonGame12computerMoveEiPFvvEi(%class.HexxagonGame* %519, i32 %520, void ()* null, i32 %mul305), !dbg !671
  %522 = load %class.HexxagonGame** %game, align 8, !dbg !675
  call void @_ZN12HexxagonGame11displayTextEv(%class.HexxagonGame* %522), !dbg !675
  br label %while.cond301, !dbg !665

while.end307:                                     ; preds = %while.cond301
  %523 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 192), !dbg !676
  %524 = add i64 %523, 1, !dbg !676
  store i64 %524, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 192), !dbg !676
  store i32 1, i32* %mode, align 4, !dbg !676
  br label %if.end310, !dbg !677

if.else308:                                       ; preds = %lor.lhs.false296, %lor.lhs.false288
  %525 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 193), !dbg !678
  %526 = add i64 %525, 1, !dbg !678
  store i64 %526, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 193), !dbg !678
  %call309 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([70 x i8]* @.str88, i32 0, i32 0)), !dbg !678
  br label %if.end310

if.end310:                                        ; preds = %if.else308, %while.end307
  %527 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 194)
  %528 = add i64 %527, 1
  store i64 %528, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 194)
  br label %if.end311

if.end311:                                        ; preds = %if.end310, %if.then283
  %529 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 195)
  %530 = add i64 %529, 1
  store i64 %530, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 195)
  br label %if.end312

if.end312:                                        ; preds = %if.end311, %if.then264
  %531 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 196)
  %532 = add i64 %531, 1
  store i64 %532, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 196)
  br label %if.end313

if.end313:                                        ; preds = %if.end312, %if.then247
  %533 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 197), !dbg !679
  %534 = add i64 %533, 1, !dbg !679
  store i64 %534, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 197), !dbg !679
  br label %if.end316, !dbg !679

if.else314:                                       ; preds = %land.lhs.true222, %lor.lhs.false218, %lor.lhs.false210, %lor.lhs.false194
  %535 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 198), !dbg !680
  %536 = add i64 %535, 1, !dbg !680
  store i64 %536, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 198), !dbg !680
  %call315 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str89, i32 0, i32 0)), !dbg !680
  br label %if.end316

if.end316:                                        ; preds = %if.else314, %if.end313
  %537 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 199), !dbg !681
  %538 = add i64 %537, 1, !dbg !681
  store i64 %538, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 199), !dbg !681
  br label %if.end475, !dbg !681

if.else317:                                       ; preds = %if.else179
  %539 = load i8** %input, align 8, !dbg !682
  %call318 = call i32 @strcasecmp(i8* getelementptr inbounds ([8 x i8]* @.str90, i32 0, i32 0), i8* %539) #11, !dbg !684
  %tobool319 = icmp ne i32 %call318, 0, !dbg !684
  %540 = select i1 %tobool319, i64 200, i64 201, !dbg !685
  %541 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %540, !dbg !685
  %542 = load i64* %541, !dbg !685
  %543 = add i64 %542, 1, !dbg !685
  store i64 %543, i64* %541, !dbg !685
  br i1 %tobool319, label %if.else322, label %if.then320, !dbg !685

if.then320:                                       ; preds = %if.else317
  %544 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 202), !dbg !686
  %545 = add i64 %544, 1, !dbg !686
  store i64 %545, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 202), !dbg !686
  %call321 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str89, i32 0, i32 0)), !dbg !686
  br label %if.end474, !dbg !688

if.else322:                                       ; preds = %if.else317
  %546 = load i8** %input, align 8, !dbg !689
  %call323 = call i32 @strncasecmp(i8* getelementptr inbounds ([6 x i8]* @.str91, i32 0, i32 0), i8* %546, i64 5) #11, !dbg !691
  %tobool324 = icmp ne i32 %call323, 0, !dbg !691
  %547 = select i1 %tobool324, i64 203, i64 204, !dbg !692
  %548 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %547, !dbg !692
  %549 = load i64* %548, !dbg !692
  %550 = add i64 %549, 1, !dbg !692
  store i64 %550, i64* %548, !dbg !692
  br i1 %tobool324, label %lor.lhs.false325, label %if.then328, !dbg !692

lor.lhs.false325:                                 ; preds = %if.else322
  %551 = load i8** %input, align 8, !dbg !693
  %call326 = call i32 @strncasecmp(i8* getelementptr inbounds ([3 x i8]* @.str92, i32 0, i32 0), i8* %551, i64 2) #11, !dbg !694
  %tobool327 = icmp ne i32 %call326, 0, !dbg !694
  %552 = select i1 %tobool327, i64 205, i64 206, !dbg !692
  %553 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %552, !dbg !692
  %554 = load i64* %553, !dbg !692
  %555 = add i64 %554, 1, !dbg !692
  store i64 %555, i64* %553, !dbg !692
  br i1 %tobool327, label %if.else404, label %if.then328, !dbg !692

if.then328:                                       ; preds = %lor.lhs.false325, %if.else322
  call void @llvm.dbg.declare(metadata i8** %cp330, metadata !695, metadata !198), !dbg !697
  %556 = load i8** %input, align 8, !dbg !698
  store i8* %556, i8** %cp330, align 8, !dbg !697
  %557 = load i8** %input, align 8, !dbg !699
  %call331 = call i32 @strncasecmp(i8* getelementptr inbounds ([3 x i8]* @.str92, i32 0, i32 0), i8* %557, i64 2) #11, !dbg !701
  %tobool332 = icmp ne i32 %call331, 0, !dbg !701
  %558 = select i1 %tobool332, i64 207, i64 208, !dbg !702
  %559 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %558, !dbg !702
  %560 = load i64* %559, !dbg !702
  %561 = add i64 %560, 1, !dbg !702
  store i64 %561, i64* %559, !dbg !702
  br i1 %tobool332, label %if.else335, label %if.then333, !dbg !702

if.then333:                                       ; preds = %if.then328
  %562 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 209), !dbg !703
  %563 = add i64 %562, 1, !dbg !703
  store i64 %563, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 209), !dbg !703
  %564 = load i8** %cp330, align 8, !dbg !703
  %add.ptr334 = getelementptr inbounds i8* %564, i64 2, !dbg !703
  store i8* %add.ptr334, i8** %cp330, align 8, !dbg !703
  br label %if.end337, !dbg !703

if.else335:                                       ; preds = %if.then328
  %565 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 210), !dbg !704
  %566 = add i64 %565, 1, !dbg !704
  store i64 %566, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 210), !dbg !704
  %567 = load i8** %cp330, align 8, !dbg !704
  %add.ptr336 = getelementptr inbounds i8* %567, i64 5, !dbg !704
  store i8* %add.ptr336, i8** %cp330, align 8, !dbg !704
  br label %if.end337

if.end337:                                        ; preds = %if.else335, %if.then333
  call void @llvm.dbg.declare(metadata %class.HexxagonMove* %move, metadata !705, metadata !198), !dbg !706
  call void @_ZN12HexxagonMoveC2Ev(%class.HexxagonMove* %move), !dbg !706
  call void @llvm.dbg.declare(metadata i32* %len340, metadata !707, metadata !198), !dbg !708
  %568 = load i8** %cp330, align 8, !dbg !709
  %call341 = call i64 @strlen(i8* %568) #11, !dbg !710
  %conv342 = trunc i64 %call341 to i32, !dbg !710
  store i32 %conv342, i32* %len340, align 4, !dbg !708
  %569 = load i32* %len340, align 4, !dbg !711
  %cmp343 = icmp eq i32 %569, 5, !dbg !711
  %570 = select i1 %cmp343, i64 211, i64 212, !dbg !713
  %571 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %570, !dbg !713
  %572 = load i64* %571, !dbg !713
  %573 = add i64 %572, 1, !dbg !713
  store i64 %573, i64* %571, !dbg !713
  br i1 %cmp343, label %if.then344, label %if.else350, !dbg !713

if.then344:                                       ; preds = %if.end337
  %574 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 213), !dbg !714
  %575 = add i64 %574, 1, !dbg !714
  store i64 %575, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 213), !dbg !714
  %576 = load i8** %cp330, align 8, !dbg !714
  %call345 = call i32 @_Z10parseCordsPc(i8* %576), !dbg !716
  %conv346 = trunc i32 %call345 to i8, !dbg !716
  %from = getelementptr inbounds %class.HexxagonMove* %move, i32 0, i32 0, !dbg !717
  store i8 %conv346, i8* %from, align 1, !dbg !717
  %577 = load i8** %cp330, align 8, !dbg !718
  %add.ptr347 = getelementptr inbounds i8* %577, i64 3, !dbg !718
  %call348 = call i32 @_Z10parseCordsPc(i8* %add.ptr347), !dbg !719
  %conv349 = trunc i32 %call348 to i8, !dbg !719
  %to = getelementptr inbounds %class.HexxagonMove* %move, i32 0, i32 1, !dbg !720
  store i8 %conv349, i8* %to, align 1, !dbg !720
  br label %if.end363, !dbg !721

if.else350:                                       ; preds = %if.end337
  %578 = load i32* %len340, align 4, !dbg !722
  %cmp351 = icmp eq i32 %578, 4, !dbg !722
  %579 = select i1 %cmp351, i64 214, i64 215, !dbg !724
  %580 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %579, !dbg !724
  %581 = load i64* %580, !dbg !724
  %582 = add i64 %581, 1, !dbg !724
  store i64 %582, i64* %580, !dbg !724
  br i1 %cmp351, label %if.then352, label %if.else360, !dbg !724

if.then352:                                       ; preds = %if.else350
  %583 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 216), !dbg !725
  %584 = add i64 %583, 1, !dbg !725
  store i64 %584, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 216), !dbg !725
  %585 = load i8** %cp330, align 8, !dbg !725
  %call353 = call i32 @_Z10parseCordsPc(i8* %585), !dbg !727
  %conv354 = trunc i32 %call353 to i8, !dbg !727
  %from355 = getelementptr inbounds %class.HexxagonMove* %move, i32 0, i32 0, !dbg !728
  store i8 %conv354, i8* %from355, align 1, !dbg !728
  %586 = load i8** %cp330, align 8, !dbg !729
  %add.ptr356 = getelementptr inbounds i8* %586, i64 2, !dbg !729
  %call357 = call i32 @_Z10parseCordsPc(i8* %add.ptr356), !dbg !730
  %conv358 = trunc i32 %call357 to i8, !dbg !730
  %to359 = getelementptr inbounds %class.HexxagonMove* %move, i32 0, i32 1, !dbg !731
  store i8 %conv358, i8* %to359, align 1, !dbg !731
  br label %if.end362, !dbg !732

if.else360:                                       ; preds = %if.else350
  %587 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 217), !dbg !733
  %588 = add i64 %587, 1, !dbg !733
  store i64 %588, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 217), !dbg !733
  %from361 = getelementptr inbounds %class.HexxagonMove* %move, i32 0, i32 0, !dbg !733
  store i8 -1, i8* %from361, align 1, !dbg !733
  br label %if.end362

if.end362:                                        ; preds = %if.else360, %if.then352
  %589 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 218)
  %590 = add i64 %589, 1
  store i64 %590, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 218)
  br label %if.end363

if.end363:                                        ; preds = %if.end362, %if.then344
  %from364 = getelementptr inbounds %class.HexxagonMove* %move, i32 0, i32 0, !dbg !734
  %591 = load i8* %from364, align 1, !dbg !734
  %conv365 = sext i8 %591 to i32, !dbg !734
  %cmp366 = icmp ne i32 %conv365, -1, !dbg !734
  %592 = select i1 %cmp366, i64 219, i64 220, !dbg !736
  %593 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %592, !dbg !736
  %594 = load i64* %593, !dbg !736
  %595 = add i64 %594, 1, !dbg !736
  store i64 %595, i64* %593, !dbg !736
  br i1 %cmp366, label %land.lhs.true367, label %if.else384, !dbg !736

land.lhs.true367:                                 ; preds = %if.end363
  %to368 = getelementptr inbounds %class.HexxagonMove* %move, i32 0, i32 1, !dbg !737
  %596 = load i8* %to368, align 1, !dbg !737
  %conv369 = sext i8 %596 to i32, !dbg !737
  %cmp370 = icmp ne i32 %conv369, -1, !dbg !737
  %597 = select i1 %cmp370, i64 221, i64 222, !dbg !736
  %598 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %597, !dbg !736
  %599 = load i64* %598, !dbg !736
  %600 = add i64 %599, 1, !dbg !736
  store i64 %600, i64* %598, !dbg !736
  br i1 %cmp370, label %if.then371, label %if.else384, !dbg !736

if.then371:                                       ; preds = %land.lhs.true367
  %601 = load %class.HexxagonGame** %game, align 8, !dbg !739
  %call372 = call i32 @_ZN12HexxagonGame11isMoveValidER12HexxagonMove(%class.HexxagonGame* %601, %class.HexxagonMove* dereferenceable(8) %move), !dbg !739
  %tobool373 = icmp ne i32 %call372, 0, !dbg !739
  %602 = select i1 %tobool373, i64 223, i64 224, !dbg !742
  %603 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %602, !dbg !742
  %604 = load i64* %603, !dbg !742
  %605 = add i64 %604, 1, !dbg !742
  store i64 %605, i64* %603, !dbg !742
  br i1 %tobool373, label %if.then374, label %if.else381, !dbg !742

if.then374:                                       ; preds = %if.then371
  %606 = load %class.HexxagonGame** %game, align 8, !dbg !743
  %call375 = call i32 @_ZN12HexxagonGame9applyMoveER12HexxagonMove(%class.HexxagonGame* %606, %class.HexxagonMove* dereferenceable(8) %move), !dbg !743
  %607 = load %class.HexxagonGame** %game, align 8, !dbg !745
  call void @_ZN12HexxagonGame11displayTextEv(%class.HexxagonGame* %607), !dbg !745
  %608 = load i32* %mode, align 4, !dbg !746
  %cmp376 = icmp ne i32 %608, 2, !dbg !746
  %609 = select i1 %cmp376, i64 225, i64 226, !dbg !748
  %610 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %609, !dbg !748
  %611 = load i64* %610, !dbg !748
  %612 = add i64 %611, 1, !dbg !748
  store i64 %612, i64* %610, !dbg !748
  br i1 %cmp376, label %if.then377, label %if.end380, !dbg !748

if.then377:                                       ; preds = %if.then374
  %613 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 227), !dbg !749
  %614 = add i64 %613, 1, !dbg !749
  store i64 %614, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 227), !dbg !749
  %615 = load %class.HexxagonGame** %game, align 8, !dbg !749
  %616 = load i32* %level, align 4, !dbg !751
  %617 = load i32* %time, align 4, !dbg !752
  %mul378 = mul nsw i32 %617, 1000, !dbg !752
  %call379 = call i32 @_ZN12HexxagonGame12computerMoveEiPFvvEi(%class.HexxagonGame* %615, i32 %616, void ()* null, i32 %mul378), !dbg !749
  %618 = load %class.HexxagonGame** %game, align 8, !dbg !753
  call void @_ZN12HexxagonGame11displayTextEv(%class.HexxagonGame* %618), !dbg !753
  br label %if.end380, !dbg !754

if.end380:                                        ; preds = %if.then377, %if.then374
  %619 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 228), !dbg !755
  %620 = add i64 %619, 1, !dbg !755
  store i64 %620, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 228), !dbg !755
  br label %if.end383, !dbg !755

if.else381:                                       ; preds = %if.then371
  %621 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 229), !dbg !756
  %622 = add i64 %621, 1, !dbg !756
  store i64 %622, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 229), !dbg !756
  %call382 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str93, i32 0, i32 0)), !dbg !756
  br label %if.end383

if.end383:                                        ; preds = %if.else381, %if.end380
  %623 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 230), !dbg !757
  %624 = add i64 %623, 1, !dbg !757
  store i64 %624, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 230), !dbg !757
  br label %if.end403, !dbg !757

if.else384:                                       ; preds = %land.lhs.true367, %if.end363
  %625 = load i32* %len340, align 4, !dbg !758
  %cmp385 = icmp eq i32 %625, 5, !dbg !758
  %626 = select i1 %cmp385, i64 231, i64 232, !dbg !761
  %627 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %626, !dbg !761
  %628 = load i64* %627, !dbg !761
  %629 = add i64 %628, 1, !dbg !761
  store i64 %629, i64* %627, !dbg !761
  br i1 %cmp385, label %if.then386, label %if.else395, !dbg !761

if.then386:                                       ; preds = %if.else384
  %630 = load i8** %cp330, align 8, !dbg !762
  %arrayidx387 = getelementptr inbounds i8* %630, i64 2, !dbg !762
  %631 = load i8* %arrayidx387, align 1, !dbg !762
  %conv388 = sext i8 %631 to i32, !dbg !762
  %cmp389 = icmp eq i32 %conv388, 32, !dbg !762
  %632 = select i1 %cmp389, i64 233, i64 234, !dbg !765
  %633 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %632, !dbg !765
  %634 = load i64* %633, !dbg !765
  %635 = add i64 %634, 1, !dbg !765
  store i64 %635, i64* %633, !dbg !765
  br i1 %cmp389, label %if.then390, label %if.else392, !dbg !765

if.then390:                                       ; preds = %if.then386
  %636 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 235), !dbg !766
  %637 = add i64 %636, 1, !dbg !766
  store i64 %637, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 235), !dbg !766
  %call391 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str94, i32 0, i32 0)), !dbg !766
  br label %if.end394, !dbg !766

if.else392:                                       ; preds = %if.then386
  %638 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 236), !dbg !767
  %639 = add i64 %638, 1, !dbg !767
  store i64 %639, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 236), !dbg !767
  %call393 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str95, i32 0, i32 0)), !dbg !767
  br label %if.end394

if.end394:                                        ; preds = %if.else392, %if.then390
  %640 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 237), !dbg !768
  %641 = add i64 %640, 1, !dbg !768
  store i64 %641, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 237), !dbg !768
  br label %if.end402, !dbg !768

if.else395:                                       ; preds = %if.else384
  %642 = load i32* %len340, align 4, !dbg !769
  %cmp396 = icmp eq i32 %642, 4, !dbg !769
  %643 = select i1 %cmp396, i64 238, i64 239, !dbg !771
  %644 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %643, !dbg !771
  %645 = load i64* %644, !dbg !771
  %646 = add i64 %645, 1, !dbg !771
  store i64 %646, i64* %644, !dbg !771
  br i1 %cmp396, label %if.then397, label %if.else399, !dbg !771

if.then397:                                       ; preds = %if.else395
  %647 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 240), !dbg !772
  %648 = add i64 %647, 1, !dbg !772
  store i64 %648, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 240), !dbg !772
  %call398 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str94, i32 0, i32 0)), !dbg !772
  br label %if.end401, !dbg !772

if.else399:                                       ; preds = %if.else395
  %649 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 241), !dbg !773
  %650 = add i64 %649, 1, !dbg !773
  store i64 %650, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 241), !dbg !773
  %call400 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str95, i32 0, i32 0)), !dbg !773
  br label %if.end401

if.end401:                                        ; preds = %if.else399, %if.then397
  %651 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 242)
  %652 = add i64 %651, 1
  store i64 %652, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 242)
  br label %if.end402

if.end402:                                        ; preds = %if.end401, %if.end394
  %653 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 243)
  %654 = add i64 %653, 1
  store i64 %654, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 243)
  br label %if.end403

if.end403:                                        ; preds = %if.end402, %if.end383
  %655 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 244), !dbg !774
  %656 = add i64 %655, 1, !dbg !774
  store i64 %656, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 244), !dbg !774
  br label %if.end473, !dbg !774

if.else404:                                       ; preds = %lor.lhs.false325
  %657 = load i8** %input, align 8, !dbg !775
  %call405 = call i32 @strcasecmp(i8* getelementptr inbounds ([5 x i8]* @.str96, i32 0, i32 0), i8* %657) #11, !dbg !777
  %tobool406 = icmp ne i32 %call405, 0, !dbg !777
  %658 = select i1 %tobool406, i64 245, i64 246, !dbg !778
  %659 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %658, !dbg !778
  %660 = load i64* %659, !dbg !778
  %661 = add i64 %660, 1, !dbg !778
  store i64 %661, i64* %659, !dbg !778
  br i1 %tobool406, label %lor.lhs.false407, label %if.then410, !dbg !778

lor.lhs.false407:                                 ; preds = %if.else404
  %662 = load i8** %input, align 8, !dbg !779
  %call408 = call i32 @strcasecmp(i8* getelementptr inbounds ([2 x i8]* @.str97, i32 0, i32 0), i8* %662) #11, !dbg !780
  %tobool409 = icmp ne i32 %call408, 0, !dbg !780
  %663 = select i1 %tobool409, i64 247, i64 248, !dbg !778
  %664 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %663, !dbg !778
  %665 = load i64* %664, !dbg !778
  %666 = add i64 %665, 1, !dbg !778
  store i64 %666, i64* %664, !dbg !778
  br i1 %tobool409, label %if.else412, label %if.then410, !dbg !778

if.then410:                                       ; preds = %lor.lhs.false407, %if.else404
  %667 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 249), !dbg !781
  %668 = add i64 %667, 1, !dbg !781
  store i64 %668, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 249), !dbg !781
  %call411 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str95, i32 0, i32 0)), !dbg !781
  br label %if.end472, !dbg !783

if.else412:                                       ; preds = %lor.lhs.false407
  %669 = load i8** %input, align 8, !dbg !784
  %call413 = call i32 @strncasecmp(i8* getelementptr inbounds ([7 x i8]* @.str98, i32 0, i32 0), i8* %669, i64 6) #11, !dbg !786
  %tobool414 = icmp ne i32 %call413, 0, !dbg !786
  %670 = select i1 %tobool414, i64 250, i64 251, !dbg !787
  %671 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %670, !dbg !787
  %672 = load i64* %671, !dbg !787
  %673 = add i64 %672, 1, !dbg !787
  store i64 %673, i64* %671, !dbg !787
  br i1 %tobool414, label %lor.lhs.false415, label %if.then418, !dbg !787

lor.lhs.false415:                                 ; preds = %if.else412
  %674 = load i8** %input, align 8, !dbg !788
  %call416 = call i32 @strncasecmp(i8* getelementptr inbounds ([3 x i8]* @.str99, i32 0, i32 0), i8* %674, i64 2) #11, !dbg !789
  %tobool417 = icmp ne i32 %call416, 0, !dbg !789
  %675 = select i1 %tobool417, i64 252, i64 253, !dbg !787
  %676 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %675, !dbg !787
  %677 = load i64* %676, !dbg !787
  %678 = add i64 %677, 1, !dbg !787
  store i64 %678, i64* %676, !dbg !787
  br i1 %tobool417, label %if.else460, label %if.then418, !dbg !787

if.then418:                                       ; preds = %lor.lhs.false415, %if.else412
  call void @llvm.dbg.declare(metadata i8** %cp420, metadata !790, metadata !198), !dbg !792
  %679 = load i8** %input, align 8, !dbg !793
  store i8* %679, i8** %cp420, align 8, !dbg !792
  %680 = load i8** %input, align 8, !dbg !794
  %call421 = call i32 @strncasecmp(i8* getelementptr inbounds ([3 x i8]* @.str99, i32 0, i32 0), i8* %680, i64 2) #11, !dbg !796
  %tobool422 = icmp ne i32 %call421, 0, !dbg !796
  %681 = select i1 %tobool422, i64 254, i64 255, !dbg !797
  %682 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %681, !dbg !797
  %683 = load i64* %682, !dbg !797
  %684 = add i64 %683, 1, !dbg !797
  store i64 %684, i64* %682, !dbg !797
  br i1 %tobool422, label %if.else425, label %if.then423, !dbg !797

if.then423:                                       ; preds = %if.then418
  %685 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 256), !dbg !798
  %686 = add i64 %685, 1, !dbg !798
  store i64 %686, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 256), !dbg !798
  %687 = load i8** %cp420, align 8, !dbg !798
  %add.ptr424 = getelementptr inbounds i8* %687, i64 2, !dbg !798
  store i8* %add.ptr424, i8** %cp420, align 8, !dbg !798
  br label %if.end427, !dbg !798

if.else425:                                       ; preds = %if.then418
  %688 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 257), !dbg !799
  %689 = add i64 %688, 1, !dbg !799
  store i64 %689, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 257), !dbg !799
  %690 = load i8** %cp420, align 8, !dbg !799
  %add.ptr426 = getelementptr inbounds i8* %690, i64 6, !dbg !799
  store i8* %add.ptr426, i8** %cp420, align 8, !dbg !799
  br label %if.end427

if.end427:                                        ; preds = %if.else425, %if.then423
  call void @llvm.dbg.declare(metadata %class.HexxagonMove* %move429, metadata !800, metadata !198), !dbg !801
  call void @_ZN12HexxagonMoveC2Ev(%class.HexxagonMove* %move429), !dbg !801
  %691 = load i8** %cp420, align 8, !dbg !802
  %call430 = call i64 @strlen(i8* %691) #11, !dbg !804
  %cmp431 = icmp eq i64 %call430, 2, !dbg !804
  %692 = select i1 %cmp431, i64 258, i64 259, !dbg !805
  %693 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %692, !dbg !805
  %694 = load i64* %693, !dbg !805
  %695 = add i64 %694, 1, !dbg !805
  store i64 %695, i64* %693, !dbg !805
  br i1 %cmp431, label %if.then432, label %if.else457, !dbg !805

if.then432:                                       ; preds = %if.end427
  %696 = load i8** %cp420, align 8, !dbg !806
  %call433 = call i32 @_Z10parseCordsPc(i8* %696), !dbg !808
  %conv434 = trunc i32 %call433 to i8, !dbg !808
  %to435 = getelementptr inbounds %class.HexxagonMove* %move429, i32 0, i32 1, !dbg !809
  store i8 %conv434, i8* %to435, align 1, !dbg !809
  %to436 = getelementptr inbounds %class.HexxagonMove* %move429, i32 0, i32 1, !dbg !810
  %697 = load i8* %to436, align 1, !dbg !810
  %from437 = getelementptr inbounds %class.HexxagonMove* %move429, i32 0, i32 0, !dbg !811
  store i8 %697, i8* %from437, align 1, !dbg !811
  %to438 = getelementptr inbounds %class.HexxagonMove* %move429, i32 0, i32 1, !dbg !812
  %698 = load i8* %to438, align 1, !dbg !812
  %conv439 = sext i8 %698 to i32, !dbg !812
  %cmp440 = icmp ne i32 %conv439, -1, !dbg !812
  %699 = select i1 %cmp440, i64 260, i64 261, !dbg !814
  %700 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %699, !dbg !814
  %701 = load i64* %700, !dbg !814
  %702 = add i64 %701, 1, !dbg !814
  store i64 %702, i64* %700, !dbg !814
  br i1 %cmp440, label %if.then441, label %if.else454, !dbg !814

if.then441:                                       ; preds = %if.then432
  %703 = load %class.HexxagonGame** %game, align 8, !dbg !815
  %call442 = call i32 @_ZN12HexxagonGame11isMoveValidER12HexxagonMove(%class.HexxagonGame* %703, %class.HexxagonMove* dereferenceable(8) %move429), !dbg !815
  %tobool443 = icmp ne i32 %call442, 0, !dbg !815
  %704 = select i1 %tobool443, i64 262, i64 263, !dbg !818
  %705 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %704, !dbg !818
  %706 = load i64* %705, !dbg !818
  %707 = add i64 %706, 1, !dbg !818
  store i64 %707, i64* %705, !dbg !818
  br i1 %tobool443, label %if.then444, label %if.else451, !dbg !818

if.then444:                                       ; preds = %if.then441
  %708 = load %class.HexxagonGame** %game, align 8, !dbg !819
  %call445 = call i32 @_ZN12HexxagonGame9applyMoveER12HexxagonMove(%class.HexxagonGame* %708, %class.HexxagonMove* dereferenceable(8) %move429), !dbg !819
  %709 = load %class.HexxagonGame** %game, align 8, !dbg !821
  call void @_ZN12HexxagonGame11displayTextEv(%class.HexxagonGame* %709), !dbg !821
  %710 = load i32* %mode, align 4, !dbg !822
  %cmp446 = icmp ne i32 %710, 2, !dbg !822
  %711 = select i1 %cmp446, i64 264, i64 265, !dbg !824
  %712 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %711, !dbg !824
  %713 = load i64* %712, !dbg !824
  %714 = add i64 %713, 1, !dbg !824
  store i64 %714, i64* %712, !dbg !824
  br i1 %cmp446, label %if.then447, label %if.end450, !dbg !824

if.then447:                                       ; preds = %if.then444
  %715 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 266), !dbg !825
  %716 = add i64 %715, 1, !dbg !825
  store i64 %716, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 266), !dbg !825
  %717 = load %class.HexxagonGame** %game, align 8, !dbg !825
  %718 = load i32* %level, align 4, !dbg !827
  %719 = load i32* %time, align 4, !dbg !828
  %mul448 = mul nsw i32 %719, 1000, !dbg !828
  %call449 = call i32 @_ZN12HexxagonGame12computerMoveEiPFvvEi(%class.HexxagonGame* %717, i32 %718, void ()* null, i32 %mul448), !dbg !825
  %720 = load %class.HexxagonGame** %game, align 8, !dbg !829
  call void @_ZN12HexxagonGame11displayTextEv(%class.HexxagonGame* %720), !dbg !829
  br label %if.end450, !dbg !830

if.end450:                                        ; preds = %if.then447, %if.then444
  %721 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 267), !dbg !831
  %722 = add i64 %721, 1, !dbg !831
  store i64 %722, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 267), !dbg !831
  br label %if.end453, !dbg !831

if.else451:                                       ; preds = %if.then441
  %723 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 268), !dbg !832
  %724 = add i64 %723, 1, !dbg !832
  store i64 %724, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 268), !dbg !832
  %call452 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str93, i32 0, i32 0)), !dbg !832
  br label %if.end453

if.end453:                                        ; preds = %if.else451, %if.end450
  %725 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 269), !dbg !833
  %726 = add i64 %725, 1, !dbg !833
  store i64 %726, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 269), !dbg !833
  br label %if.end456, !dbg !833

if.else454:                                       ; preds = %if.then432
  %727 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 270), !dbg !834
  %728 = add i64 %727, 1, !dbg !834
  store i64 %728, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 270), !dbg !834
  %call455 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str100, i32 0, i32 0)), !dbg !834
  br label %if.end456

if.end456:                                        ; preds = %if.else454, %if.end453
  %729 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 271), !dbg !835
  %730 = add i64 %729, 1, !dbg !835
  store i64 %730, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 271), !dbg !835
  br label %if.end459, !dbg !835

if.else457:                                       ; preds = %if.end427
  %731 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 272), !dbg !836
  %732 = add i64 %731, 1, !dbg !836
  store i64 %732, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 272), !dbg !836
  %call458 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str101, i32 0, i32 0)), !dbg !836
  br label %if.end459

if.end459:                                        ; preds = %if.else457, %if.end456
  %733 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 273), !dbg !837
  %734 = add i64 %733, 1, !dbg !837
  store i64 %734, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 273), !dbg !837
  br label %if.end471, !dbg !837

if.else460:                                       ; preds = %lor.lhs.false415
  %735 = load i8** %input, align 8, !dbg !838
  %call461 = call i32 @strcasecmp(i8* getelementptr inbounds ([6 x i8]* @.str102, i32 0, i32 0), i8* %735) #11, !dbg !840
  %tobool462 = icmp ne i32 %call461, 0, !dbg !840
  %736 = select i1 %tobool462, i64 274, i64 275, !dbg !841
  %737 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %736, !dbg !841
  %738 = load i64* %737, !dbg !841
  %739 = add i64 %738, 1, !dbg !841
  store i64 %739, i64* %737, !dbg !841
  br i1 %tobool462, label %lor.lhs.false463, label %if.then466, !dbg !841

lor.lhs.false463:                                 ; preds = %if.else460
  %740 = load i8** %input, align 8, !dbg !842
  %call464 = call i32 @strcasecmp(i8* getelementptr inbounds ([2 x i8]* @.str103, i32 0, i32 0), i8* %740) #11, !dbg !843
  %tobool465 = icmp ne i32 %call464, 0, !dbg !843
  %741 = select i1 %tobool465, i64 276, i64 277, !dbg !841
  %742 = getelementptr inbounds [303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 %741, !dbg !841
  %743 = load i64* %742, !dbg !841
  %744 = add i64 %743, 1, !dbg !841
  store i64 %744, i64* %742, !dbg !841
  br i1 %tobool465, label %if.else468, label %if.then466, !dbg !841

if.then466:                                       ; preds = %lor.lhs.false463, %if.else460
  %745 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 278), !dbg !844
  %746 = add i64 %745, 1, !dbg !844
  store i64 %746, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 278), !dbg !844
  %call467 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str101, i32 0, i32 0)), !dbg !844
  br label %if.end470, !dbg !846

if.else468:                                       ; preds = %lor.lhs.false463
  %747 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 279), !dbg !847
  %748 = add i64 %747, 1, !dbg !847
  store i64 %748, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 279), !dbg !847
  %call469 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([53 x i8]* @.str104, i32 0, i32 0)), !dbg !847
  br label %if.end470

if.end470:                                        ; preds = %if.else468, %if.then466
  %749 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 280)
  %750 = add i64 %749, 1
  store i64 %750, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 280)
  br label %if.end471

if.end471:                                        ; preds = %if.end470, %if.end459
  %751 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 281)
  %752 = add i64 %751, 1
  store i64 %752, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 281)
  br label %if.end472

if.end472:                                        ; preds = %if.end471, %if.then410
  %753 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 282)
  %754 = add i64 %753, 1
  store i64 %754, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 282)
  br label %if.end473

if.end473:                                        ; preds = %if.end472, %if.end403
  %755 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 283)
  %756 = add i64 %755, 1
  store i64 %756, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 283)
  br label %if.end474

if.end474:                                        ; preds = %if.end473, %if.then320
  %757 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 284)
  %758 = add i64 %757, 1
  store i64 %758, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 284)
  br label %if.end475

if.end475:                                        ; preds = %if.end474, %if.end316
  %759 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 285)
  %760 = add i64 %759, 1
  store i64 %760, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 285)
  br label %if.end476

if.end476:                                        ; preds = %if.end475, %if.then177
  %761 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 286)
  %762 = add i64 %761, 1
  store i64 %762, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 286)
  br label %if.end477

if.end477:                                        ; preds = %if.end476, %if.end173
  %763 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 287)
  %764 = add i64 %763, 1
  store i64 %764, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 287)
  br label %if.end478

if.end478:                                        ; preds = %if.end477, %if.then153
  %765 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 288)
  %766 = add i64 %765, 1
  store i64 %766, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 288)
  br label %if.end479

if.end479:                                        ; preds = %if.end478, %if.end149
  %767 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 289)
  %768 = add i64 %767, 1
  store i64 %768, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 289)
  br label %if.end480

if.end480:                                        ; preds = %if.end479, %if.end126
  %769 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 290)
  %770 = add i64 %769, 1
  store i64 %770, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 290)
  br label %if.end481

if.end481:                                        ; preds = %if.end480, %if.end116
  %771 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 291)
  %772 = add i64 %771, 1
  store i64 %772, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 291)
  br label %if.end482

if.end482:                                        ; preds = %if.end481, %if.end106
  %773 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 292)
  %774 = add i64 %773, 1
  store i64 %774, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 292)
  br label %if.end483

if.end483:                                        ; preds = %if.end482, %if.then96
  %775 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 293)
  %776 = add i64 %775, 1
  store i64 %776, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 293)
  br label %if.end484

if.end484:                                        ; preds = %if.end483, %if.then91
  %777 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 294)
  %778 = add i64 %777, 1
  store i64 %778, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 294)
  br label %if.end485

if.end485:                                        ; preds = %if.end484, %if.end87
  %779 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 295)
  %780 = add i64 %779, 1
  store i64 %780, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 295)
  br label %if.end486

if.end486:                                        ; preds = %if.end485, %if.then60
  %781 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 296)
  %782 = add i64 %781, 1
  store i64 %782, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 296)
  br label %if.end487

if.end487:                                        ; preds = %if.end486, %if.end56
  %783 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 297)
  %784 = add i64 %783, 1
  store i64 %784, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 297)
  br label %if.end488

if.end488:                                        ; preds = %if.end487, %if.then37
  %785 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 298)
  %786 = add i64 %785, 1
  store i64 %786, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 298)
  br label %if.end489

if.end489:                                        ; preds = %if.end488, %if.then33
  %787 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 299)
  %788 = add i64 %787, 1
  store i64 %788, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 299)
  br label %if.end490

if.end490:                                        ; preds = %if.end489, %if.then29
  %789 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 300), !dbg !848
  %790 = add i64 %789, 1, !dbg !848
  store i64 %790, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 300), !dbg !848
  br label %for.inc, !dbg !848

for.inc:                                          ; preds = %if.end490, %if.then23
  %791 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 301), !dbg !849
  %792 = add i64 %791, 1, !dbg !849
  store i64 %792, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 301), !dbg !849
  %793 = load i32* %llvm_index, align 4, !dbg !849
  %inc = add nsw i32 %793, 1, !dbg !849
  store i32 %inc, i32* %llvm_index, align 4, !dbg !849
  br label %for.cond, !dbg !850

for.end:                                          ; preds = %for.cond
  %794 = load i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 302), !dbg !397
  %795 = add i64 %794, 1, !dbg !397
  store i64 %795, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 302), !dbg !397
  %796 = load i32* %retval, !dbg !397
  ret i32 %796, !dbg !397

eh.resume:                                        ; preds = %lpad230, %lpad227, %lpad
  %exn = load i8** %exn.slot, !dbg !851
  %sel = load i32* %ehselector.slot, !dbg !851
  %lpad.val = insertvalue { i8*, i32 } undef, i8* %exn, 0, !dbg !851
  %lpad.val491 = insertvalue { i8*, i32 } %lpad.val, i32 %sel, 1, !dbg !851
  resume { i8*, i32 } %lpad.val491, !dbg !851
}

; Function Attrs: nobuiltin
declare noalias i8* @_Znwm(i64) #4

declare void @_ZN12HexxagonGameC1Ev(%class.HexxagonGame*) #3

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #5

; Function Attrs: uwtable
define linkonce_odr void @_ZN12HexxagonGame11displayTextEv(%class.HexxagonGame* %this) #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr113, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr113, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonGame*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr113, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr113, i64 0, i64 1)
  store %class.HexxagonGame* %this, %class.HexxagonGame** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonGame** %this.addr, metadata !854, metadata !198), !dbg !855
  %this1 = load %class.HexxagonGame** %this.addr
  %curr = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !856
  %5 = load %class.GameList** %curr, align 8, !dbg !856
  %6 = bitcast %class.GameList* %5 to %class.HexxagonBoard*, !dbg !856
  %turn = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 0, !dbg !857
  %7 = load i32* %turn, align 4, !dbg !857
  call void @_ZN13HexxagonBoard16displayBoardTextEi(%class.HexxagonBoard* %6, i32 %7), !dbg !856
  ret void, !dbg !858
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #6

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #7

; Function Attrs: nounwind readonly
declare i32 @strcasecmp(i8*, i8*) #7

; Function Attrs: nounwind readonly
declare i32 @strncasecmp(i8*, i8*, i64) #7

; Function Attrs: nounwind
declare i32 @isdigit(i32) #8

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #7

declare i32 @_ZN12HexxagonGame4prevEv(%class.HexxagonGame*) #3

declare i32 @_ZN12HexxagonGame4nextEv(%class.HexxagonGame*) #3

declare i32 @_ZN12HexxagonGame12computerMoveEiPFvvEi(%class.HexxagonGame*, i32, void ()*, i32) #3

declare i32 @_ZN12HexxagonGame8loadGameEPc(%class.HexxagonGame*, i8*) #3

declare i32 @_ZN12HexxagonGame8saveGameEPc(%class.HexxagonGame*, i8*) #3

; Function Attrs: uwtable
define linkonce_odr void @_ZN12HexxagonGameD2Ev(%class.HexxagonGame* %this) unnamed_addr #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr112, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr112, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonGame*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  store %class.HexxagonGame* %this, %class.HexxagonGame** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonGame** %this.addr, metadata !859, metadata !198), !dbg !860
  %this1 = load %class.HexxagonGame** %this.addr
  call void @_ZN12HexxagonGame11destroyRestEv(%class.HexxagonGame* %this1), !dbg !861
  %first = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 1, !dbg !863
  %3 = load %class.GameList** %first, align 8, !dbg !863
  %isnull = icmp eq %class.GameList* %3, null, !dbg !864
  %4 = select i1 %isnull, i64 1, i64 2, !dbg !864
  %5 = getelementptr inbounds [5 x i64]* @__llvm_gcov_ctr112, i64 0, i64 %4, !dbg !864
  %6 = load i64* %5, !dbg !864
  %7 = add i64 %6, 1, !dbg !864
  store i64 %7, i64* %5, !dbg !864
  br i1 %isnull, label %delete.end, label %delete.notnull, !dbg !864

delete.notnull:                                   ; preds = %2
  %8 = load i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr112, i64 0, i64 3), !dbg !865
  %9 = add i64 %8, 1, !dbg !865
  store i64 %9, i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr112, i64 0, i64 3), !dbg !865
  %10 = bitcast %class.GameList* %3 to i8*, !dbg !865
  call void @_ZdlPv(i8* %10) #12, !dbg !865
  br label %delete.end, !dbg !865

delete.end:                                       ; preds = %delete.notnull, %2
  %11 = load i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr112, i64 0, i64 4), !dbg !867
  %12 = add i64 %11, 1, !dbg !867
  store i64 %12, i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr112, i64 0, i64 4), !dbg !867
  ret void, !dbg !867
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZN12HexxagonGame9endOfGameEv(%class.HexxagonGame* %this) #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr111, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr111, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonGame*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr111, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr111, i64 0, i64 1)
  store %class.HexxagonGame* %this, %class.HexxagonGame** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonGame** %this.addr, metadata !870, metadata !198), !dbg !871
  %this1 = load %class.HexxagonGame** %this.addr
  %curr = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !872
  %5 = load %class.GameList** %curr, align 8, !dbg !872
  %6 = bitcast %class.GameList* %5 to %class.HexxagonBoard*, !dbg !872
  %call = call i32 @_ZN13HexxagonBoard9endOfGameEv(%class.HexxagonBoard* %6), !dbg !872
  ret i32 %call, !dbg !873
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN12HexxagonMoveC2Ev(%class.HexxagonMove* %this) unnamed_addr #0 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr110, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr110, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonMove*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr110, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr110, i64 0, i64 1)
  store %class.HexxagonMove* %this, %class.HexxagonMove** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonMove** %this.addr, metadata !874, metadata !198), !dbg !876
  %this1 = load %class.HexxagonMove** %this.addr
  ret void, !dbg !877
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZN12HexxagonGame11isMoveValidER12HexxagonMove(%class.HexxagonGame* %this, %class.HexxagonMove* dereferenceable(8) %move) #2 align 2 {
entry:
  %0 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr109, i64 0, i64 0)
  %1 = add i64 %0, 1
  store i64 %1, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr109, i64 0, i64 0)
  %this.addr = alloca %class.HexxagonGame*, align 8
  %move.addr = alloca %class.HexxagonMove*, align 8
  br label %2

; <label>:2                                       ; preds = %entry
  %3 = load i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr109, i64 0, i64 1)
  %4 = add i64 %3, 1
  store i64 %4, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr109, i64 0, i64 1)
  store %class.HexxagonGame* %this, %class.HexxagonGame** %this.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonGame** %this.addr, metadata !878, metadata !198), !dbg !879
  store %class.HexxagonMove* %move, %class.HexxagonMove** %move.addr, align 8
  call void @llvm.dbg.declare(metadata %class.HexxagonMove** %move.addr, metadata !880, metadata !198), !dbg !882
  %this1 = load %class.HexxagonGame** %this.addr
  %curr = getelementptr inbounds %class.HexxagonGame* %this1, i32 0, i32 2, !dbg !883
  %5 = load %class.GameList** %curr, align 8, !dbg !883
  %6 = bitcast %class.GameList* %5 to %class.HexxagonBoard*, !dbg !883
  %7 = load %class.HexxagonMove** %move.addr, align 8, !dbg !883
  %call = call i32 @_ZN13HexxagonBoard11isMoveValidER12HexxagonMove(%class.HexxagonBoard* %6, %class.HexxagonMove* dereferenceable(8) %7), !dbg !883
  ret i32 %call, !dbg !884
}

declare i32 @_ZN12HexxagonGame9applyMoveER12HexxagonMove(%class.HexxagonGame*, %class.HexxagonMove* dereferenceable(8)) #3

declare i32 @_ZN13HexxagonBoard11isMoveValidER12HexxagonMove(%class.HexxagonBoard*, %class.HexxagonMove* dereferenceable(8)) #3

declare i32 @_ZN13HexxagonBoard9endOfGameEv(%class.HexxagonBoard*) #3

declare void @_ZN12HexxagonGame11destroyRestEv(%class.HexxagonGame*) #3

declare void @_ZN13HexxagonBoard16displayBoardTextEi(%class.HexxagonBoard*, i32) #3

; Function Attrs: noinline
define internal void @__llvm_gcov_indirect_counter_increment(i32* %predecessor, i64** %counters) unnamed_addr #9 {
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
define internal void @__llvm_gcov_writeout() unnamed_addr #9 {
entry:
  call void @llvm_gcda_start_file(i8* getelementptr inbounds ([90 x i8]* @1, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @0, i32 0, i32 0), i32 -885000618)
  call void @llvm_gcda_emit_function(i32 0, i8* getelementptr inbounds ([24 x i8]* @2, i32 0, i32 0), i32 -1368310890, i8 0, i32 -885000618)
  call void @llvm_gcda_emit_arcs(i32 19, i64* getelementptr inbounds ([19 x i64]* @__llvm_gcov_ctr, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 1, i8* getelementptr inbounds ([14 x i8]* @3, i32 0, i32 0), i32 -1319983393, i8 0, i32 -885000618)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr105, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 2, i8* getelementptr inbounds ([14 x i8]* @4, i32 0, i32 0), i32 909389231, i8 0, i32 -885000618)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr106, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 3, i8* getelementptr inbounds ([17 x i8]* @5, i32 0, i32 0), i32 -1379681463, i8 0, i32 -885000618)
  call void @llvm_gcda_emit_arcs(i32 28, i64* getelementptr inbounds ([28 x i64]* @__llvm_gcov_ctr107, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 4, i8* getelementptr inbounds ([5 x i8]* @6, i32 0, i32 0), i32 -1610182935, i8 0, i32 -885000618)
  call void @llvm_gcda_emit_arcs(i32 303, i64* getelementptr inbounds ([303 x i64]* @__llvm_gcov_ctr108, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 5, i8* getelementptr inbounds ([47 x i8]* @7, i32 0, i32 0), i32 -1621058019, i8 0, i32 -885000618)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr109, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 6, i8* getelementptr inbounds ([22 x i8]* @8, i32 0, i32 0), i32 -269156019, i8 0, i32 -885000618)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr110, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 7, i8* getelementptr inbounds ([30 x i8]* @9, i32 0, i32 0), i32 431141478, i8 0, i32 -885000618)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr111, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 8, i8* getelementptr inbounds ([22 x i8]* @10, i32 0, i32 0), i32 534020457, i8 0, i32 -885000618)
  call void @llvm_gcda_emit_arcs(i32 5, i64* getelementptr inbounds ([5 x i64]* @__llvm_gcov_ctr112, i64 0, i64 0))
  call void @llvm_gcda_emit_function(i32 9, i8* getelementptr inbounds ([33 x i8]* @11, i32 0, i32 0), i32 -2055452378, i8 0, i32 -885000618)
  call void @llvm_gcda_emit_arcs(i32 2, i64* getelementptr inbounds ([2 x i64]* @__llvm_gcov_ctr113, i64 0, i64 0))
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
define internal void @__llvm_gcov_flush() unnamed_addr #9 {
entry:
  call void @__llvm_gcov_writeout()
  store [19 x i64] zeroinitializer, [19 x i64]* @__llvm_gcov_ctr
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr105
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr106
  store [28 x i64] zeroinitializer, [28 x i64]* @__llvm_gcov_ctr107
  store [303 x i64] zeroinitializer, [303 x i64]* @__llvm_gcov_ctr108
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr109
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr110
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr111
  store [5 x i64] zeroinitializer, [5 x i64]* @__llvm_gcov_ctr112
  store [2 x i64] zeroinitializer, [2 x i64]* @__llvm_gcov_ctr113
  ret void
}

; Function Attrs: noinline
define internal void @__llvm_gcov_init() unnamed_addr #9 {
entry:
  call void @llvm_gcov_init(void ()* @__llvm_gcov_writeout, void ()* @__llvm_gcov_flush)
  ret void
}

declare void @llvm_gcov_init(void ()*, void ()*)

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nobuiltin "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nobuiltin nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noinline }
attributes #10 = { builtin }
attributes #11 = { nounwind readonly }
attributes #12 = { builtin nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!193, !194}
!llvm.gcov = !{!195}
!llvm.ident = !{!196}

!0 = !{!"0x11\004\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !7, !173, !178, !178} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp] [DW_LANG_C_plus_plus]
!1 = !{!"hexxagon.cpp", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!2 = !{!3}
!3 = !{!"0x4\00\00121\0032\0032\000\000\000", !1, null, null, !4, null, null, null} ; [ DW_TAG_enumeration_type ] [line 121, size 32, align 32, offset 0] [def] [from ]
!4 = !{!5, !6}
!5 = !{!"0x28\00GAME_HC\001"}                     ; [ DW_TAG_enumerator ] [GAME_HC :: 1]
!6 = !{!"0x28\00GAME_HH\002"}                     ; [ DW_TAG_enumerator ] [GAME_HH :: 2]
!7 = !{!8, !52, !61, !112, !154, !156, !172}
!8 = !{!"0x2\00HexxagonGame\0037\00192\0064\000\000\000", !9, null, null, !10, null, null, !"_ZTS12HexxagonGame"} ; [ DW_TAG_class_type ] [HexxagonGame] [line 37, size 192, align 64, offset 0] [def] [from ]
!9 = !{!"./hexxagongame.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!10 = !{!11, !13, !15, !16, !20, !21, !24, !25, !26, !27, !28, !32, !38, !39, !43, !44, !45, !46, !51}
!11 = !{!"0xd\00turn\0067\0032\0032\000\002", !9, !"_ZTS12HexxagonGame", !12} ; [ DW_TAG_member ] [turn] [line 67, size 32, align 32, offset 0] [protected] [from int]
!12 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!13 = !{!"0xd\00first\0069\0064\0064\0064\002", !9, !"_ZTS12HexxagonGame", !14} ; [ DW_TAG_member ] [first] [line 69, size 64, align 64, offset 64] [protected] [from ]
!14 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS8GameList"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS8GameList]
!15 = !{!"0xd\00curr\0070\0064\0064\00128\002", !9, !"_ZTS12HexxagonGame", !14} ; [ DW_TAG_member ] [curr] [line 70, size 64, align 64, offset 128] [protected] [from ]
!16 = !{!"0x2e\00HexxagonGame\00HexxagonGame\00\0040\000\000\000\000\00259\000\0040", !9, !"_ZTS12HexxagonGame", !17, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 40] [public] [HexxagonGame]
!17 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !18, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = !{null, !19}
!19 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS12HexxagonGame"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS12HexxagonGame]
!20 = !{!"0x2e\00~HexxagonGame\00~HexxagonGame\00\0041\000\000\000\000\00259\000\0041", !9, !"_ZTS12HexxagonGame", !17, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 41] [public] [~HexxagonGame]
!21 = !{!"0x2e\00getTurn\00getTurn\00_ZN12HexxagonGame7getTurnEv\0043\000\000\000\000\00259\000\0043", !9, !"_ZTS12HexxagonGame", !22, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 43] [public] [getTurn]
!22 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !23, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!23 = !{!12, !19}
!24 = !{!"0x2e\00next\00next\00_ZN12HexxagonGame4nextEv\0045\000\000\000\000\00259\000\0045", !9, !"_ZTS12HexxagonGame", !22, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 45] [public] [next]
!25 = !{!"0x2e\00prev\00prev\00_ZN12HexxagonGame4prevEv\0046\000\000\000\000\00259\000\0046", !9, !"_ZTS12HexxagonGame", !22, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 46] [public] [prev]
!26 = !{!"0x2e\00reset\00reset\00_ZN12HexxagonGame5resetEv\0048\000\000\000\000\00259\000\0048", !9, !"_ZTS12HexxagonGame", !17, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 48] [public] [reset]
!27 = !{!"0x2e\00destroyRest\00destroyRest\00_ZN12HexxagonGame11destroyRestEv\0049\000\000\000\000\00259\000\0049", !9, !"_ZTS12HexxagonGame", !17, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 49] [public] [destroyRest]
!28 = !{!"0x2e\00applyMove\00applyMove\00_ZN12HexxagonGame9applyMoveER12HexxagonMove\0051\000\000\000\000\00259\000\0051", !9, !"_ZTS12HexxagonGame", !29, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 51] [public] [applyMove]
!29 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !30, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = !{!12, !19, !31}
!31 = !{!"0x10\00\000\000\000\000\000", null, null, !"_ZTS12HexxagonMove"} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from _ZTS12HexxagonMove]
!32 = !{!"0x2e\00computerMove\00computerMove\00_ZN12HexxagonGame12computerMoveEiPFvvEi\0052\000\000\000\000\00259\000\0052", !9, !"_ZTS12HexxagonGame", !33, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 52] [public] [computerMove]
!33 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !34, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!34 = !{!12, !19, !12, !35, !12}
!35 = !{!"0xf\00\000\0064\0064\000\000", null, null, !36} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!36 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !37, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!37 = !{null}
!38 = !{!"0x2e\00noBoards\00noBoards\00_ZN12HexxagonGame8noBoardsEv\0054\000\000\000\000\00259\000\0054", !9, !"_ZTS12HexxagonGame", !22, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 54] [public] [noBoards]
!39 = !{!"0x2e\00getBoard\00getBoard\00_ZN12HexxagonGame8getBoardEv\0056\000\000\000\000\00259\000\0056", !9, !"_ZTS12HexxagonGame", !40, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 56] [public] [getBoard]
!40 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !41, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!41 = !{!42, !19}
!42 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS13HexxagonBoard"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS13HexxagonBoard]
!43 = !{!"0x2e\00endOfGame\00endOfGame\00_ZN12HexxagonGame9endOfGameEv\0058\000\000\000\000\00259\000\0058", !9, !"_ZTS12HexxagonGame", !22, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 58] [public] [endOfGame]
!44 = !{!"0x2e\00isMoveValid\00isMoveValid\00_ZN12HexxagonGame11isMoveValidER12HexxagonMove\0059\000\000\000\000\00259\000\0059", !9, !"_ZTS12HexxagonGame", !29, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 59] [public] [isMoveValid]
!45 = !{!"0x2e\00displayText\00displayText\00_ZN12HexxagonGame11displayTextEv\0061\000\000\000\000\00259\000\0061", !9, !"_ZTS12HexxagonGame", !17, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 61] [public] [displayText]
!46 = !{!"0x2e\00saveGame\00saveGame\00_ZN12HexxagonGame8saveGameEPc\0063\000\000\000\000\00259\000\0063", !9, !"_ZTS12HexxagonGame", !47, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 63] [public] [saveGame]
!47 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !48, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!48 = !{!12, !19, !49}
!49 = !{!"0xf\00\000\0064\0064\000\000", null, null, !50} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!50 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!51 = !{!"0x2e\00loadGame\00loadGame\00_ZN12HexxagonGame8loadGameEPc\0064\000\000\000\000\00259\000\0064", !9, !"_ZTS12HexxagonGame", !47, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 64] [public] [loadGame]
!52 = !{!"0x2\00GameList\0028\00256\0064\000\000\000", !9, null, null, !53, null, null, !"_ZTS8GameList"} ; [ DW_TAG_class_type ] [GameList] [line 28, size 256, align 64, offset 0] [def] [from ]
!53 = !{!54, !55, !56, !57}
!54 = !{!"0x1c\00\000\000\000\000\003", null, !"_ZTS8GameList", !"_ZTS13HexxagonBoard"} ; [ DW_TAG_inheritance ] [line 0, size 0, align 0, offset 0] [public] [from _ZTS13HexxagonBoard]
!55 = !{!"0xd\00next\0033\0064\0064\00128\003", !9, !"_ZTS8GameList", !14} ; [ DW_TAG_member ] [next] [line 33, size 64, align 64, offset 128] [public] [from ]
!56 = !{!"0xd\00prev\0034\0064\0064\00192\003", !9, !"_ZTS8GameList", !14} ; [ DW_TAG_member ] [prev] [line 34, size 64, align 64, offset 192] [public] [from ]
!57 = !{!"0x2e\00GameList\00GameList\00\0031\000\000\000\000\00259\000\0031", !9, !"_ZTS8GameList", !58, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 31] [public] [GameList]
!58 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !59, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!59 = !{null, !60, !14}
!60 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS8GameList"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS8GameList]
!61 = !{!"0x2\00HexxagonBoard\0050\00128\0032\000\000\000", !62, null, null, !63, null, null, !"_ZTS13HexxagonBoard"} ; [ DW_TAG_class_type ] [HexxagonBoard] [line 50, size 128, align 32, offset 0] [def] [from ]
!62 = !{!"./hexxagonboard.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!63 = !{!64, !65, !66, !70, !75, !76, !79, !82, !83, !86, !90, !93, !94, !95, !98, !99, !102, !108, !109}
!64 = !{!"0xd\00board\0080\0064\0032\000\002", !62, !"_ZTS13HexxagonBoard", !"_ZTS10BitBoard64"} ; [ DW_TAG_member ] [board] [line 80, size 64, align 32, offset 0] [protected] [from _ZTS10BitBoard64]
!65 = !{!"0xd\00color\0081\0064\0032\0064\002", !62, !"_ZTS13HexxagonBoard", !"_ZTS10BitBoard64"} ; [ DW_TAG_member ] [color] [line 81, size 64, align 32, offset 64] [protected] [from _ZTS10BitBoard64]
!66 = !{!"0x2e\00HexxagonBoard\00HexxagonBoard\00\0054\000\000\000\000\00259\000\0054", !62, !"_ZTS13HexxagonBoard", !67, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 54] [public] [HexxagonBoard]
!67 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !68, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!68 = !{null, !69}
!69 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS13HexxagonBoard"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS13HexxagonBoard]
!70 = !{!"0x2e\00HexxagonBoard\00HexxagonBoard\00\0055\000\000\000\000\00259\000\0055", !62, !"_ZTS13HexxagonBoard", !71, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 55] [public] [HexxagonBoard]
!71 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !72, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!72 = !{null, !69, !73}
!73 = !{!"0x10\00\000\000\000\000\000", null, null, !74} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!74 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS13HexxagonBoard"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS13HexxagonBoard]
!75 = !{!"0x2e\00init\00init\00_ZN13HexxagonBoard4initEv\0057\000\000\000\000\00259\000\0057", !62, !"_ZTS13HexxagonBoard", !67, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 57] [public] [init]
!76 = !{!"0x2e\00evaluate\00evaluate\00_ZN13HexxagonBoard8evaluateEv\0058\000\000\000\000\00259\000\0058", !62, !"_ZTS13HexxagonBoard", !77, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 58] [public] [evaluate]
!77 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !78, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!78 = !{!12, !69}
!79 = !{!"0x2e\00countBricks\00countBricks\00_ZN13HexxagonBoard11countBricksEi\0059\000\000\000\000\00259\000\0059", !62, !"_ZTS13HexxagonBoard", !80, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 59] [public] [countBricks]
!80 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !81, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!81 = !{!12, !69, !12}
!82 = !{!"0x2e\00getHexxagon\00getHexxagon\00_ZN13HexxagonBoard11getHexxagonEi\0060\000\000\000\000\00259\000\0060", !62, !"_ZTS13HexxagonBoard", !80, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 60] [public] [getHexxagon]
!83 = !{!"0x2e\00applyMove\00applyMove\00_ZN13HexxagonBoard9applyMoveER12HexxagonMove\0061\000\000\000\000\00259\000\0061", !62, !"_ZTS13HexxagonBoard", !84, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 61] [public] [applyMove]
!84 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !85, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!85 = !{!12, !69, !31}
!86 = !{!"0x2e\00generateMoveList\00generateMoveList\00_ZN13HexxagonBoard16generateMoveListEv\0063\000\000\000\000\00259\000\0063", !62, !"_ZTS13HexxagonBoard", !87, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 63] [public] [generateMoveList]
!87 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !88, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!88 = !{!89, !69}
!89 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS16HexxagonMoveList"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS16HexxagonMoveList]
!90 = !{!"0x2e\00computerMove\00computerMove\00_ZN13HexxagonBoard12computerMoveEiPFvvEi\0065\000\000\000\000\00259\000\0065", !62, !"_ZTS13HexxagonBoard", !91, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 65] [public] [computerMove]
!91 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !92, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!92 = !{!12, !69, !12, !35, !12}
!93 = !{!"0x2e\00endOfGame\00endOfGame\00_ZN13HexxagonBoard9endOfGameEv\0066\000\000\000\000\00259\000\0066", !62, !"_ZTS13HexxagonBoard", !77, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 66] [public] [endOfGame]
!94 = !{!"0x2e\00isMoveValid\00isMoveValid\00_ZN13HexxagonBoard11isMoveValidER12HexxagonMove\0067\000\000\000\000\00259\000\0067", !62, !"_ZTS13HexxagonBoard", !84, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 67] [public] [isMoveValid]
!95 = !{!"0x2e\00getBBBoard\00getBBBoard\00_ZN13HexxagonBoard10getBBBoardEv\0069\000\000\000\000\00259\000\0069", !62, !"_ZTS13HexxagonBoard", !96, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 69] [public] [getBBBoard]
!96 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !97, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!97 = !{!"_ZTS10BitBoard64", !69}
!98 = !{!"0x2e\00getBBColor\00getBBColor\00_ZN13HexxagonBoard10getBBColorEv\0070\000\000\000\000\00259\000\0070", !62, !"_ZTS13HexxagonBoard", !96, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 70] [public] [getBBColor]
!99 = !{!"0x2e\00operator=\00operator=\00_ZN13HexxagonBoardaSERKS_\0072\000\000\000\000\00259\000\0072", !62, !"_ZTS13HexxagonBoard", !100, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 72] [public] [operator=]
!100 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !101, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!101 = !{!"_ZTS13HexxagonBoard", !69, !73}
!102 = !{!"0x2e\00readFromFile\00readFromFile\00_ZN13HexxagonBoard12readFromFileEP8_IO_FILE\0074\000\000\000\000\00259\000\0074", !62, !"_ZTS13HexxagonBoard", !103, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 74] [public] [readFromFile]
!103 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !104, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!104 = !{!12, !69, !105}
!105 = !{!"0xf\00\000\0064\0064\000\000", null, null, !106} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!106 = !{!"0x16\00FILE\0048\000\000\000\000", !107, null, !"_ZTS8_IO_FILE"} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _ZTS8_IO_FILE]
!107 = !{!"/usr/include/stdio.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!108 = !{!"0x2e\00writeToFile\00writeToFile\00_ZN13HexxagonBoard11writeToFileEP8_IO_FILE\0075\000\000\000\000\00259\000\0075", !62, !"_ZTS13HexxagonBoard", !103, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 75] [public] [writeToFile]
!109 = !{!"0x2e\00displayBoardText\00displayBoardText\00_ZN13HexxagonBoard16displayBoardTextEi\0077\000\000\000\000\00259\000\0077", !62, !"_ZTS13HexxagonBoard", !110, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 77] [public] [displayBoardText]
!110 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !111, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!111 = !{null, !69, !12}
!112 = !{!"0x2\00BitBoard64\0031\0064\0032\000\000\000", !113, null, null, !114, null, null, !"_ZTS10BitBoard64"} ; [ DW_TAG_class_type ] [BitBoard64] [line 31, size 64, align 32, offset 0] [def] [from ]
!113 = !{!"./bitboard64.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!114 = !{!115, !119, !120, !124, !127, !130, !131, !134, !139, !140, !141, !142, !145, !149, !150, !153}
!115 = !{!"0xd\00lowbits\0056\0032\0032\000\000", !113, !"_ZTS10BitBoard64", !116} ; [ DW_TAG_member ] [lowbits] [line 56, size 32, align 32, offset 0] [from uint32_t]
!116 = !{!"0x16\00uint32_t\0051\000\000\000\000", !117, null, !118} ; [ DW_TAG_typedef ] [uint32_t] [line 51, size 0, align 0, offset 0] [from unsigned int]
!117 = !{!"/usr/include/stdint.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!118 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!119 = !{!"0xd\00highbits\0056\0032\0032\0032\000", !113, !"_ZTS10BitBoard64", !116} ; [ DW_TAG_member ] [highbits] [line 56, size 32, align 32, offset 32] [from uint32_t]
!120 = !{!"0x2e\00BitBoard64\00BitBoard64\00\0034\000\000\000\000\00259\000\0034", !113, !"_ZTS10BitBoard64", !121, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 34] [public] [BitBoard64]
!121 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !122, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!122 = !{null, !123}
!123 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS10BitBoard64"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS10BitBoard64]
!124 = !{!"0x2e\00BitBoard64\00BitBoard64\00\0035\000\000\000\000\00259\000\0035", !113, !"_ZTS10BitBoard64", !125, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 35] [public] [BitBoard64]
!125 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !126, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!126 = !{null, !123, !116, !116}
!127 = !{!"0x2e\00setBit\00setBit\00_ZN10BitBoard646setBitEi\0037\000\000\000\000\00259\000\0037", !113, !"_ZTS10BitBoard64", !128, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 37] [public] [setBit]
!128 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !129, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!129 = !{null, !123, !12}
!130 = !{!"0x2e\00unSetBit\00unSetBit\00_ZN10BitBoard648unSetBitEi\0038\000\000\000\000\00259\000\0038", !113, !"_ZTS10BitBoard64", !128, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 38] [public] [unSetBit]
!131 = !{!"0x2e\00getBit\00getBit\00_ZN10BitBoard646getBitEi\0039\000\000\000\000\00259\000\0039", !113, !"_ZTS10BitBoard64", !132, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 39] [public] [getBit]
!132 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !133, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!133 = !{!12, !123, !12}
!134 = !{!"0x2e\00operator&\00operator&\00_ZN10BitBoard64anERKS_\0041\000\000\000\000\00259\000\0041", !113, !"_ZTS10BitBoard64", !135, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 41] [public] [operator&]
!135 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !136, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!136 = !{!"_ZTS10BitBoard64", !123, !137}
!137 = !{!"0x10\00\000\000\000\000\000", null, null, !138} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!138 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS10BitBoard64"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS10BitBoard64]
!139 = !{!"0x2e\00operator|\00operator|\00_ZN10BitBoard64orERKS_\0042\000\000\000\000\00259\000\0042", !113, !"_ZTS10BitBoard64", !135, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 42] [public] [operator|]
!140 = !{!"0x2e\00operator^\00operator^\00_ZN10BitBoard64eoERKS_\0043\000\000\000\000\00259\000\0043", !113, !"_ZTS10BitBoard64", !135, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 43] [public] [operator^]
!141 = !{!"0x2e\00operator=\00operator=\00_ZN10BitBoard64aSERKS_\0044\000\000\000\000\00259\000\0044", !113, !"_ZTS10BitBoard64", !135, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 44] [public] [operator=]
!142 = !{!"0x2e\00operator~\00operator~\00_ZN10BitBoard64coEv\0045\000\000\000\000\00259\000\0045", !113, !"_ZTS10BitBoard64", !143, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 45] [public] [operator~]
!143 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !144, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!144 = !{!"_ZTS10BitBoard64", !123}
!145 = !{!"0x2e\00operator bool\00operator bool\00_ZN10BitBoard64cvbEv\0047\000\000\000\000\00259\000\0047", !113, !"_ZTS10BitBoard64", !146, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 47] [public] [operator bool]
!146 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !147, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!147 = !{!148, !123}
!148 = !{!"0x24\00bool\000\008\008\000\000\002", null, null} ; [ DW_TAG_base_type ] [bool] [line 0, size 8, align 8, offset 0, enc DW_ATE_boolean]
!149 = !{!"0x2e\00print\00print\00_ZN10BitBoard645printEv\0049\000\000\000\000\00259\000\0049", !113, !"_ZTS10BitBoard64", !121, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 49] [public] [print]
!150 = !{!"0x2e\00readFromFile\00readFromFile\00_ZN10BitBoard6412readFromFileEP8_IO_FILE\0051\000\000\000\000\00259\000\0051", !113, !"_ZTS10BitBoard64", !151, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 51] [public] [readFromFile]
!151 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !152, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!152 = !{!12, !123, !105}
!153 = !{!"0x2e\00writeToFile\00writeToFile\00_ZN10BitBoard6411writeToFileEP8_IO_FILE\0052\000\000\000\000\00259\000\0052", !113, !"_ZTS10BitBoard64", !151, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 52] [public] [writeToFile]
!154 = !{!"0x13\00_IO_FILE\00245\000\000\000\004\000", !155, null, null, null, null, null, !"_ZTS8_IO_FILE"} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 0, align 0, offset 0] [decl] [from ]
!155 = !{!"/usr/include/libio.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!156 = !{!"0x2\00HexxagonMove\0032\0064\0032\000\000\000", !157, null, null, !158, null, null, !"_ZTS12HexxagonMove"} ; [ DW_TAG_class_type ] [HexxagonMove] [line 32, size 64, align 32, offset 0] [def] [from ]
!157 = !{!"./hexxagonmove.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon"}
!158 = !{!159, !160, !161, !162, !166, !169}
!159 = !{!"0xd\00from\0039\008\008\000\003", !157, !"_ZTS12HexxagonMove", !50} ; [ DW_TAG_member ] [from] [line 39, size 8, align 8, offset 0] [public] [from char]
!160 = !{!"0xd\00to\0039\008\008\008\003", !157, !"_ZTS12HexxagonMove", !50} ; [ DW_TAG_member ] [to] [line 39, size 8, align 8, offset 8] [public] [from char]
!161 = !{!"0xd\00score\0040\0032\0032\0032\003", !157, !"_ZTS12HexxagonMove", !12} ; [ DW_TAG_member ] [score] [line 40, size 32, align 32, offset 32] [public] [from int]
!162 = !{!"0x2e\00HexxagonMove\00HexxagonMove\00\0035\000\000\000\000\00259\000\0035", !157, !"_ZTS12HexxagonMove", !163, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 35] [public] [HexxagonMove]
!163 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !164, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!164 = !{null, !165}
!165 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS12HexxagonMove"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS12HexxagonMove]
!166 = !{!"0x2e\00HexxagonMove\00HexxagonMove\00\0036\000\000\000\000\00259\000\0036", !157, !"_ZTS12HexxagonMove", !167, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 36] [public] [HexxagonMove]
!167 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !168, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!168 = !{null, !165, !12}
!169 = !{!"0x2e\00HexxagonMove\00HexxagonMove\00\0037\000\000\000\000\00259\000\0037", !157, !"_ZTS12HexxagonMove", !170, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 37] [public] [HexxagonMove]
!170 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !171, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!171 = !{null, !165, !12, !12}
!172 = !{!"0x2\00HexxagonMoveList\0043\000\000\000\004\000", !157, null, null, null, null, null, !"_ZTS16HexxagonMoveList"} ; [ DW_TAG_class_type ] [HexxagonMoveList] [line 43, size 0, align 0, offset 0] [decl] [from ]
!173 = !{!174, !179, !180, !181, !184, !188, !189, !190, !191, !192}
!174 = !{!"0x2e\00stripFromDblSpace\00stripFromDblSpace\00_Z17stripFromDblSpacePc\0030\000\001\000\000\00256\000\0031", !1, !175, !176, null, void (i8*)* @_Z17stripFromDblSpacePc, null, null, !178} ; [ DW_TAG_subprogram ] [line 30] [def] [scope 31] [stripFromDblSpace]
!175 = !{!"0x29", !1}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!176 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !177, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!177 = !{null, !49}
!178 = !{}
!179 = !{!"0x2e\00printCopy\00printCopy\00_Z9printCopyv\0054\000\001\000\000\00256\000\0055", !1, !175, !36, null, void ()* @_Z9printCopyv, null, null, !178} ; [ DW_TAG_subprogram ] [line 54] [def] [scope 55] [printCopy]
!180 = !{!"0x2e\00printHelp\00printHelp\00_Z9printHelpv\0079\000\001\000\000\00256\000\0080", !1, !175, !36, null, void ()* @_Z9printHelpv, null, null, !178} ; [ DW_TAG_subprogram ] [line 79] [def] [scope 80] [printHelp]
!181 = !{!"0x2e\00parseCords\00parseCords\00_Z10parseCordsPc\00127\000\001\000\000\00256\000\00128", !1, !175, !182, null, i32 (i8*)* @_Z10parseCordsPc, null, null, !178} ; [ DW_TAG_subprogram ] [line 127] [def] [scope 128] [parseCords]
!182 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !183, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!183 = !{!12, !49}
!184 = !{!"0x2e\00main\00main\00\00149\000\001\000\000\00256\000\00150", !1, !175, !185, null, i32 (i32, i8**)* @main, null, null, !178} ; [ DW_TAG_subprogram ] [line 149] [def] [scope 150] [main]
!185 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !186, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!186 = !{!12, !12, !187}
!187 = !{!"0xf\00\000\0064\0064\000\000", null, null, !49} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!188 = !{!"0x2e\00isMoveValid\00isMoveValid\00_ZN12HexxagonGame11isMoveValidER12HexxagonMove\0059\000\001\000\000\00256\000\0059", !9, !"_ZTS12HexxagonGame", !29, null, i32 (%class.HexxagonGame*, %class.HexxagonMove*)* @_ZN12HexxagonGame11isMoveValidER12HexxagonMove, null, !44, !178} ; [ DW_TAG_subprogram ] [line 59] [def] [isMoveValid]
!189 = !{!"0x2e\00HexxagonMove\00HexxagonMove\00_ZN12HexxagonMoveC2Ev\0035\000\001\000\000\00256\000\0035", !157, !"_ZTS12HexxagonMove", !163, null, void (%class.HexxagonMove*)* @_ZN12HexxagonMoveC2Ev, null, !162, !178} ; [ DW_TAG_subprogram ] [line 35] [def] [HexxagonMove]
!190 = !{!"0x2e\00endOfGame\00endOfGame\00_ZN12HexxagonGame9endOfGameEv\0058\000\001\000\000\00256\000\0058", !9, !"_ZTS12HexxagonGame", !22, null, i32 (%class.HexxagonGame*)* @_ZN12HexxagonGame9endOfGameEv, null, !43, !178} ; [ DW_TAG_subprogram ] [line 58] [def] [endOfGame]
!191 = !{!"0x2e\00~HexxagonGame\00~HexxagonGame\00_ZN12HexxagonGameD2Ev\0041\000\001\000\000\00256\000\0041", !9, !"_ZTS12HexxagonGame", !17, null, void (%class.HexxagonGame*)* @_ZN12HexxagonGameD2Ev, null, !20, !178} ; [ DW_TAG_subprogram ] [line 41] [def] [~HexxagonGame]
!192 = !{!"0x2e\00displayText\00displayText\00_ZN12HexxagonGame11displayTextEv\0061\000\001\000\000\00256\000\0061", !9, !"_ZTS12HexxagonGame", !17, null, void (%class.HexxagonGame*)* @_ZN12HexxagonGame11displayTextEv, null, !45, !178} ; [ DW_TAG_subprogram ] [line 61] [def] [displayText]
!193 = !{i32 2, !"Dwarf Version", i32 4}
!194 = !{i32 2, !"Debug Info Version", i32 2}
!195 = !{!"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp", !0}
!196 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!197 = !{!"0x101\00cpfrom\0016777246\000", !174, !175, !49} ; [ DW_TAG_arg_variable ] [cpfrom] [line 30]
!198 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!199 = !MDLocation(line: 30, column: 30, scope: !174)
!200 = !{!"0x100\00cpto\0032\000", !174, !175, !49} ; [ DW_TAG_auto_variable ] [cpto] [line 32]
!201 = !MDLocation(line: 32, column: 8, scope: !174)
!202 = !MDLocation(line: 32, column: 15, scope: !174)
!203 = !{!"0x100\00space\0033\000", !174, !175, !12} ; [ DW_TAG_auto_variable ] [space] [line 33]
!204 = !MDLocation(line: 33, column: 6, scope: !174)
!205 = !MDLocation(line: 35, column: 2, scope: !174)
!206 = !MDLocation(line: 35, column: 9, scope: !207)
!207 = !{!"0xb\002", !1, !208}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!208 = !{!"0xb\001", !1, !174}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!209 = !MDLocation(line: 35, column: 8, scope: !174)
!210 = !MDLocation(line: 37, column: 8, scope: !211)
!211 = !{!"0xb\0037\006\001", !1, !212}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!212 = !{!"0xb\0036\002\000", !1, !174}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!213 = !MDLocation(line: 37, column: 6, scope: !212)
!214 = !MDLocation(line: 37, column: 19, scope: !215)
!215 = !{!"0xb\001", !1, !211}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!216 = !MDLocation(line: 37, column: 18, scope: !211)
!217 = !MDLocation(line: 37, column: 37, scope: !218)
!218 = !{!"0xb\002", !1, !211}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!219 = !MDLocation(line: 37, column: 36, scope: !211)
!220 = !MDLocation(line: 39, column: 13, scope: !221)
!221 = !{!"0xb\0038\003\002", !1, !211}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!222 = !MDLocation(line: 39, column: 12, scope: !221)
!223 = !MDLocation(line: 39, column: 5, scope: !221)
!224 = !MDLocation(line: 39, column: 4, scope: !221)
!225 = !MDLocation(line: 40, column: 4, scope: !221)
!226 = !MDLocation(line: 41, column: 3, scope: !221)
!227 = !MDLocation(line: 43, column: 7, scope: !228)
!228 = !{!"0xb\0043\006\003", !1, !212}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!229 = !MDLocation(line: 43, column: 6, scope: !228)
!230 = !MDLocation(line: 43, column: 6, scope: !212)
!231 = !MDLocation(line: 43, column: 25, scope: !232)
!232 = !{!"0xb\001", !1, !228}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!233 = !MDLocation(line: 43, column: 24, scope: !228)
!234 = !MDLocation(line: 44, column: 4, scope: !228)
!235 = !MDLocation(line: 46, column: 4, scope: !228)
!236 = !MDLocation(line: 48, column: 3, scope: !212)
!237 = !MDLocation(line: 51, column: 3, scope: !174)
!238 = !MDLocation(line: 51, column: 2, scope: !174)
!239 = !MDLocation(line: 52, column: 1, scope: !174)
!240 = !MDLocation(line: 56, column: 2, scope: !179)
!241 = !MDLocation(line: 57, column: 2, scope: !179)
!242 = !MDLocation(line: 58, column: 2, scope: !179)
!243 = !MDLocation(line: 60, column: 2, scope: !179)
!244 = !MDLocation(line: 62, column: 2, scope: !179)
!245 = !MDLocation(line: 63, column: 2, scope: !179)
!246 = !MDLocation(line: 64, column: 2, scope: !179)
!247 = !MDLocation(line: 65, column: 2, scope: !179)
!248 = !MDLocation(line: 67, column: 2, scope: !179)
!249 = !MDLocation(line: 68, column: 2, scope: !179)
!250 = !MDLocation(line: 69, column: 2, scope: !179)
!251 = !MDLocation(line: 70, column: 2, scope: !179)
!252 = !MDLocation(line: 72, column: 2, scope: !179)
!253 = !MDLocation(line: 73, column: 2, scope: !179)
!254 = !MDLocation(line: 74, column: 2, scope: !179)
!255 = !MDLocation(line: 76, column: 2, scope: !179)
!256 = !MDLocation(line: 77, column: 1, scope: !179)
!257 = !MDLocation(line: 81, column: 2, scope: !180)
!258 = !MDLocation(line: 82, column: 2, scope: !180)
!259 = !MDLocation(line: 83, column: 2, scope: !180)
!260 = !MDLocation(line: 84, column: 2, scope: !180)
!261 = !MDLocation(line: 85, column: 2, scope: !180)
!262 = !MDLocation(line: 86, column: 2, scope: !180)
!263 = !MDLocation(line: 87, column: 2, scope: !180)
!264 = !MDLocation(line: 88, column: 2, scope: !180)
!265 = !MDLocation(line: 89, column: 2, scope: !180)
!266 = !MDLocation(line: 90, column: 2, scope: !180)
!267 = !MDLocation(line: 91, column: 2, scope: !180)
!268 = !MDLocation(line: 92, column: 2, scope: !180)
!269 = !MDLocation(line: 93, column: 2, scope: !180)
!270 = !MDLocation(line: 94, column: 2, scope: !180)
!271 = !MDLocation(line: 95, column: 2, scope: !180)
!272 = !MDLocation(line: 96, column: 2, scope: !180)
!273 = !MDLocation(line: 97, column: 2, scope: !180)
!274 = !MDLocation(line: 98, column: 2, scope: !180)
!275 = !MDLocation(line: 99, column: 2, scope: !180)
!276 = !MDLocation(line: 100, column: 2, scope: !180)
!277 = !MDLocation(line: 101, column: 2, scope: !180)
!278 = !MDLocation(line: 102, column: 2, scope: !180)
!279 = !MDLocation(line: 103, column: 2, scope: !180)
!280 = !MDLocation(line: 104, column: 2, scope: !180)
!281 = !MDLocation(line: 105, column: 2, scope: !180)
!282 = !MDLocation(line: 106, column: 2, scope: !180)
!283 = !MDLocation(line: 107, column: 2, scope: !180)
!284 = !MDLocation(line: 108, column: 2, scope: !180)
!285 = !MDLocation(line: 109, column: 2, scope: !180)
!286 = !MDLocation(line: 110, column: 2, scope: !180)
!287 = !MDLocation(line: 111, column: 2, scope: !180)
!288 = !MDLocation(line: 112, column: 2, scope: !180)
!289 = !MDLocation(line: 113, column: 2, scope: !180)
!290 = !MDLocation(line: 114, column: 2, scope: !180)
!291 = !MDLocation(line: 115, column: 2, scope: !180)
!292 = !MDLocation(line: 116, column: 2, scope: !180)
!293 = !MDLocation(line: 117, column: 2, scope: !180)
!294 = !MDLocation(line: 118, column: 2, scope: !180)
!295 = !MDLocation(line: 119, column: 1, scope: !180)
!296 = !{!"0x101\00str\0016777343\000", !181, !175, !49} ; [ DW_TAG_arg_variable ] [str] [line 127]
!297 = !MDLocation(line: 127, column: 22, scope: !181)
!298 = !MDLocation(line: 129, column: 9, scope: !299)
!299 = !{!"0xb\00129\006\004", !1, !181}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!300 = !MDLocation(line: 129, column: 8, scope: !299)
!301 = !MDLocation(line: 129, column: 6, scope: !181)
!302 = !MDLocation(line: 129, column: 24, scope: !303)
!303 = !{!"0xb\001", !1, !299}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!304 = !MDLocation(line: 129, column: 23, scope: !299)
!305 = !MDLocation(line: 130, column: 6, scope: !299)
!306 = !MDLocation(line: 130, column: 5, scope: !299)
!307 = !MDLocation(line: 130, column: 21, scope: !299)
!308 = !MDLocation(line: 130, column: 20, scope: !299)
!309 = !MDLocation(line: 130, column: 38, scope: !299)
!310 = !MDLocation(line: 130, column: 55, scope: !299)
!311 = !{!"0x100\00x\00132\000", !312, !175, !12} ; [ DW_TAG_auto_variable ] [x] [line 132]
!312 = !{!"0xb\00131\003\005", !1, !299}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!313 = !MDLocation(line: 132, column: 9, scope: !312)
!314 = !{!"0x100\00y\00132\000", !312, !175, !12} ; [ DW_TAG_auto_variable ] [y] [line 132]
!315 = !MDLocation(line: 132, column: 12, scope: !312)
!316 = !MDLocation(line: 134, column: 9, scope: !317)
!317 = !{!"0xb\00134\008\006", !1, !312}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!318 = !MDLocation(line: 134, column: 8, scope: !317)
!319 = !MDLocation(line: 134, column: 8, scope: !312)
!320 = !MDLocation(line: 134, column: 24, scope: !321)
!321 = !{!"0xb\001", !1, !317}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!322 = !MDLocation(line: 134, column: 23, scope: !317)
!323 = !MDLocation(line: 135, column: 12, scope: !317)
!324 = !MDLocation(line: 135, column: 11, scope: !317)
!325 = !MDLocation(line: 135, column: 7, scope: !317)
!326 = !MDLocation(line: 136, column: 14, scope: !327)
!327 = !{!"0xb\00136\0013\007", !1, !317}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!328 = !MDLocation(line: 136, column: 13, scope: !327)
!329 = !MDLocation(line: 136, column: 13, scope: !317)
!330 = !MDLocation(line: 136, column: 29, scope: !331)
!331 = !{!"0xb\001", !1, !327}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!332 = !MDLocation(line: 136, column: 28, scope: !327)
!333 = !MDLocation(line: 137, column: 12, scope: !327)
!334 = !MDLocation(line: 137, column: 11, scope: !327)
!335 = !MDLocation(line: 137, column: 7, scope: !327)
!336 = !MDLocation(line: 139, column: 7, scope: !327)
!337 = !MDLocation(line: 141, column: 9, scope: !312)
!338 = !MDLocation(line: 141, column: 5, scope: !312)
!339 = !MDLocation(line: 143, column: 29, scope: !312)
!340 = !MDLocation(line: 143, column: 36, scope: !312)
!341 = !MDLocation(line: 143, column: 12, scope: !312)
!342 = !MDLocation(line: 143, column: 5, scope: !312)
!343 = !MDLocation(line: 146, column: 3, scope: !181)
!344 = !MDLocation(line: 147, column: 1, scope: !181)
!345 = !{!"0x101\00argc\0016777365\000", !184, !175, !12} ; [ DW_TAG_arg_variable ] [argc] [line 149]
!346 = !MDLocation(line: 149, column: 14, scope: !184)
!347 = !{!"0x101\00argv\0033554581\000", !184, !175, !187} ; [ DW_TAG_arg_variable ] [argv] [line 149]
!348 = !MDLocation(line: 149, column: 26, scope: !184)
!349 = !{!"0x100\00quit\00151\000", !184, !175, !12} ; [ DW_TAG_auto_variable ] [quit] [line 151]
!350 = !MDLocation(line: 151, column: 6, scope: !184)
!351 = !{!"0x100\00mode\00153\000", !184, !175, !12} ; [ DW_TAG_auto_variable ] [mode] [line 153]
!352 = !MDLocation(line: 153, column: 6, scope: !184)
!353 = !{!"0x100\00level\00157\000", !184, !175, !12} ; [ DW_TAG_auto_variable ] [level] [line 157]
!354 = !MDLocation(line: 157, column: 13, scope: !184)
!355 = !{!"0x100\00time\00159\000", !184, !175, !12} ; [ DW_TAG_auto_variable ] [time] [line 159]
!356 = !MDLocation(line: 159, column: 6, scope: !184)
!357 = !{!"0x100\00llvm_index\00161\000", !184, !175, !12} ; [ DW_TAG_auto_variable ] [llvm_index] [line 161]
!358 = !MDLocation(line: 161, column: 7, scope: !184)
!359 = !MDLocation(line: 163, column: 2, scope: !184)
!360 = !MDLocation(line: 164, column: 2, scope: !184)
!361 = !MDLocation(line: 165, column: 2, scope: !184)
!362 = !MDLocation(line: 166, column: 2, scope: !184)
!363 = !{!"0x100\00game\00168\000", !184, !175, !364} ; [ DW_TAG_auto_variable ] [game] [line 168]
!364 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS12HexxagonGame"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS12HexxagonGame]
!365 = !MDLocation(line: 168, column: 16, scope: !184)
!366 = !MDLocation(line: 168, column: 23, scope: !184)
!367 = !MDLocation(line: 168, column: 16, scope: !368)
!368 = !{!"0xb\001", !1, !184}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!369 = !MDLocation(line: 169, column: 2, scope: !184)
!370 = !{!"0x100\00input\00171\000", !184, !175, !49} ; [ DW_TAG_auto_variable ] [input] [line 171]
!371 = !MDLocation(line: 171, column: 8, scope: !184)
!372 = !MDLocation(line: 173, column: 7, scope: !373)
!373 = !{!"0xb\00173\002\008", !1, !184}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!374 = !MDLocation(line: 173, column: 23, scope: !375)
!375 = !{!"0xb\002", !1, !376}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!376 = !{!"0xb\001", !1, !377}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!377 = !{!"0xb\00173\002\009", !1, !373}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!378 = !MDLocation(line: 173, column: 2, scope: !373)
!379 = !{!"0x100\00tmp\00175\000", !380, !175, !381} ; [ DW_TAG_auto_variable ] [tmp] [line 175]
!380 = !{!"0xb\00174\002\0010", !1, !377}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!381 = !{!"0x1\00\000\0088\008\000\000\000", null, null, !50, !382, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 88, align 8, offset 0] [from char]
!382 = !{!383}
!383 = !{!"0x21\000\0011"}                        ; [ DW_TAG_subrange_type ] [0, 10]
!384 = !MDLocation(line: 175, column: 16, scope: !380)
!385 = !{!"0x100\00len\00177\000", !380, !175, !12} ; [ DW_TAG_auto_variable ] [len] [line 177]
!386 = !MDLocation(line: 177, column: 7, scope: !380)
!387 = !MDLocation(line: 177, column: 20, scope: !380)
!388 = !MDLocation(line: 177, column: 13, scope: !380)
!389 = !MDLocation(line: 178, column: 6, scope: !390)
!390 = !{!"0xb\00178\006\0011", !1, !380}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!391 = !MDLocation(line: 178, column: 6, scope: !380)
!392 = !MDLocation(line: 178, column: 17, scope: !393)
!393 = !{!"0xb\001", !1, !390}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!394 = !MDLocation(line: 178, column: 13, scope: !390)
!395 = !MDLocation(line: 179, column: 8, scope: !390)
!396 = !MDLocation(line: 179, column: 4, scope: !390)
!397 = !MDLocation(line: 434, column: 1, scope: !184)
!398 = !MDLocation(line: 181, column: 7, scope: !399)
!399 = !{!"0xb\00181\006\0012", !1, !380}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!400 = !MDLocation(line: 181, column: 6, scope: !399)
!401 = !MDLocation(line: 181, column: 6, scope: !380)
!402 = !MDLocation(line: 183, column: 7, scope: !403)
!403 = !{!"0xb\00183\007\0014", !1, !404}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!404 = !{!"0xb\00182\003\0013", !1, !399}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!405 = !MDLocation(line: 183, column: 7, scope: !404)
!406 = !MDLocation(line: 184, column: 5, scope: !403)
!407 = !MDLocation(line: 185, column: 3, scope: !404)
!408 = !MDLocation(line: 188, column: 12, scope: !409)
!409 = !{!"0xb\00187\003\0015", !1, !399}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!410 = !MDLocation(line: 188, column: 4, scope: !409)
!411 = !MDLocation(line: 191, column: 7, scope: !412)
!412 = !{!"0xb\00191\006\0016", !1, !380}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!413 = !MDLocation(line: 191, column: 6, scope: !380)
!414 = !MDLocation(line: 192, column: 4, scope: !412)
!415 = !MDLocation(line: 194, column: 26, scope: !416)
!416 = !{!"0xb\00194\006\0017", !1, !380}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!417 = !MDLocation(line: 194, column: 7, scope: !416)
!418 = !MDLocation(line: 194, column: 6, scope: !380)
!419 = !MDLocation(line: 194, column: 56, scope: !420)
!420 = !{!"0xb\001", !1, !416}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!421 = !MDLocation(line: 194, column: 37, scope: !416)
!422 = !MDLocation(line: 196, column: 4, scope: !423)
!423 = !{!"0xb\00195\003\0018", !1, !416}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!424 = !MDLocation(line: 197, column: 3, scope: !423)
!425 = !MDLocation(line: 198, column: 31, scope: !426)
!426 = !{!"0xb\00198\0011\0019", !1, !416}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!427 = !MDLocation(line: 198, column: 12, scope: !426)
!428 = !MDLocation(line: 198, column: 11, scope: !416)
!429 = !MDLocation(line: 199, column: 4, scope: !426)
!430 = !MDLocation(line: 200, column: 36, scope: !431)
!431 = !{!"0xb\00200\0011\0020", !1, !426}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!432 = !MDLocation(line: 200, column: 12, scope: !431)
!433 = !MDLocation(line: 200, column: 11, scope: !426)
!434 = !MDLocation(line: 201, column: 4, scope: !431)
!435 = !MDLocation(line: 202, column: 34, scope: !436)
!436 = !{!"0xb\00202\0011\0021", !1, !431}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!437 = !MDLocation(line: 202, column: 12, scope: !436)
!438 = !MDLocation(line: 202, column: 11, scope: !431)
!439 = !MDLocation(line: 204, column: 17, scope: !440)
!440 = !{!"0xb\00204\007\0023", !1, !441}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!441 = !{!"0xb\00203\003\0022", !1, !436}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!442 = !MDLocation(line: 204, column: 9, scope: !440)
!443 = !MDLocation(line: 204, column: 7, scope: !441)
!444 = !MDLocation(line: 204, column: 30, scope: !445)
!445 = !{!"0xb\001", !1, !440}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!446 = !MDLocation(line: 205, column: 5, scope: !440)
!447 = !MDLocation(line: 207, column: 13, scope: !440)
!448 = !MDLocation(line: 207, column: 5, scope: !440)
!449 = !MDLocation(line: 208, column: 3, scope: !441)
!450 = !MDLocation(line: 209, column: 32, scope: !451)
!451 = !{!"0xb\00209\0011\0024", !1, !436}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!452 = !MDLocation(line: 209, column: 12, scope: !451)
!453 = !MDLocation(line: 209, column: 11, scope: !436)
!454 = !MDLocation(line: 210, column: 48, scope: !451)
!455 = !MDLocation(line: 210, column: 4, scope: !451)
!456 = !MDLocation(line: 211, column: 33, scope: !457)
!457 = !{!"0xb\00211\0011\0025", !1, !451}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!458 = !MDLocation(line: 211, column: 12, scope: !457)
!459 = !MDLocation(line: 211, column: 11, scope: !451)
!460 = !MDLocation(line: 213, column: 10, scope: !461)
!461 = !{!"0xb\00212\003\0026", !1, !457}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!462 = !{!"0x100\00cp\00213\000", !461, !175, !49} ; [ DW_TAG_auto_variable ] [cp] [line 213]
!463 = !MDLocation(line: 213, column: 15, scope: !461)
!464 = !MDLocation(line: 215, column: 4, scope: !461)
!465 = !MDLocation(line: 215, column: 19, scope: !466)
!466 = !{!"0xb\002", !1, !467}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!467 = !{!"0xb\001", !1, !461}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!468 = !MDLocation(line: 215, column: 18, scope: !461)
!469 = !MDLocation(line: 215, column: 10, scope: !461)
!470 = !MDLocation(line: 216, column: 5, scope: !461)
!471 = !MDLocation(line: 218, column: 7, scope: !472)
!472 = !{!"0xb\00218\007\0027", !1, !461}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!473 = !MDLocation(line: 218, column: 13, scope: !472)
!474 = !MDLocation(line: 218, column: 7, scope: !461)
!475 = !MDLocation(line: 218, column: 28, scope: !476)
!476 = !{!"0xb\001", !1, !472}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!477 = !MDLocation(line: 218, column: 27, scope: !472)
!478 = !MDLocation(line: 218, column: 43, scope: !479)
!479 = !{!"0xb\002", !1, !472}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!480 = !MDLocation(line: 218, column: 42, scope: !472)
!481 = !MDLocation(line: 218, column: 59, scope: !482)
!482 = !{!"0xb\003", !1, !472}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!483 = !MDLocation(line: 218, column: 57, scope: !472)
!484 = !MDLocation(line: 219, column: 5, scope: !472)
!485 = !MDLocation(line: 221, column: 17, scope: !472)
!486 = !MDLocation(line: 221, column: 12, scope: !472)
!487 = !MDLocation(line: 221, column: 5, scope: !472)
!488 = !MDLocation(line: 222, column: 3, scope: !461)
!489 = !MDLocation(line: 223, column: 31, scope: !490)
!490 = !{!"0xb\00223\0011\0028", !1, !457}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!491 = !MDLocation(line: 223, column: 12, scope: !490)
!492 = !MDLocation(line: 223, column: 11, scope: !457)
!493 = !MDLocation(line: 224, column: 50, scope: !490)
!494 = !MDLocation(line: 224, column: 4, scope: !490)
!495 = !MDLocation(line: 225, column: 32, scope: !496)
!496 = !{!"0xb\00225\0011\0029", !1, !490}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!497 = !MDLocation(line: 225, column: 12, scope: !496)
!498 = !MDLocation(line: 225, column: 11, scope: !490)
!499 = !MDLocation(line: 226, column: 4, scope: !496)
!500 = !MDLocation(line: 227, column: 31, scope: !501)
!501 = !{!"0xb\00227\0011\0030", !1, !496}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!502 = !MDLocation(line: 227, column: 12, scope: !501)
!503 = !MDLocation(line: 227, column: 11, scope: !496)
!504 = !MDLocation(line: 229, column: 7, scope: !505)
!505 = !{!"0xb\00229\007\0032", !1, !506}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!506 = !{!"0xb\00228\003\0031", !1, !501}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!507 = !MDLocation(line: 229, column: 7, scope: !506)
!508 = !MDLocation(line: 230, column: 5, scope: !505)
!509 = !MDLocation(line: 232, column: 5, scope: !505)
!510 = !MDLocation(line: 233, column: 3, scope: !506)
!511 = !MDLocation(line: 234, column: 31, scope: !512)
!512 = !{!"0xb\00234\0011\0033", !1, !501}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!513 = !MDLocation(line: 234, column: 12, scope: !512)
!514 = !MDLocation(line: 234, column: 11, scope: !501)
!515 = !MDLocation(line: 236, column: 7, scope: !516)
!516 = !{!"0xb\00236\007\0035", !1, !517}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!517 = !{!"0xb\00235\003\0034", !1, !512}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!518 = !MDLocation(line: 236, column: 7, scope: !517)
!519 = !MDLocation(line: 237, column: 5, scope: !516)
!520 = !MDLocation(line: 239, column: 5, scope: !516)
!521 = !MDLocation(line: 240, column: 3, scope: !517)
!522 = !MDLocation(line: 241, column: 31, scope: !523)
!523 = !{!"0xb\00241\0011\0036", !1, !512}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!524 = !MDLocation(line: 241, column: 12, scope: !523)
!525 = !MDLocation(line: 241, column: 11, scope: !512)
!526 = !MDLocation(line: 243, column: 4, scope: !527)
!527 = !{!"0xb\00242\003\0037", !1, !523}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!528 = !MDLocation(line: 243, column: 23, scope: !527)
!529 = !MDLocation(line: 243, column: 33, scope: !527)
!530 = !MDLocation(line: 244, column: 4, scope: !527)
!531 = !MDLocation(line: 246, column: 7, scope: !532)
!532 = !{!"0xb\00246\007\0038", !1, !527}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!533 = !MDLocation(line: 246, column: 7, scope: !527)
!534 = !MDLocation(line: 248, column: 6, scope: !535)
!535 = !{!"0xb\00247\004\0039", !1, !532}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!536 = !MDLocation(line: 248, column: 25, scope: !535)
!537 = !MDLocation(line: 248, column: 35, scope: !535)
!538 = !MDLocation(line: 249, column: 6, scope: !535)
!539 = !MDLocation(line: 250, column: 4, scope: !535)
!540 = !MDLocation(line: 251, column: 3, scope: !527)
!541 = !MDLocation(line: 252, column: 33, scope: !542)
!542 = !{!"0xb\00252\0011\0040", !1, !523}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!543 = !MDLocation(line: 252, column: 12, scope: !542)
!544 = !MDLocation(line: 252, column: 11, scope: !523)
!545 = !{!"0x100\00ret\00254\000", !546, !175, !12} ; [ DW_TAG_auto_variable ] [ret] [line 254]
!546 = !{!"0xb\00253\003\0041", !1, !542}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!547 = !MDLocation(line: 254, column: 8, scope: !546)
!548 = !MDLocation(line: 254, column: 14, scope: !546)
!549 = !MDLocation(line: 254, column: 29, scope: !546)
!550 = !MDLocation(line: 255, column: 7, scope: !551)
!551 = !{!"0xb\00255\007\0042", !1, !546}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!552 = !MDLocation(line: 255, column: 7, scope: !546)
!553 = !MDLocation(line: 257, column: 5, scope: !554)
!554 = !{!"0xb\00256\004\0043", !1, !551}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!555 = !MDLocation(line: 258, column: 5, scope: !554)
!556 = !MDLocation(line: 259, column: 4, scope: !554)
!557 = !MDLocation(line: 260, column: 12, scope: !558)
!558 = !{!"0xb\00260\0012\0044", !1, !551}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!559 = !MDLocation(line: 260, column: 12, scope: !551)
!560 = !MDLocation(line: 261, column: 5, scope: !558)
!561 = !MDLocation(line: 262, column: 12, scope: !562)
!562 = !{!"0xb\00262\0012\0045", !1, !558}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!563 = !MDLocation(line: 262, column: 12, scope: !558)
!564 = !MDLocation(line: 263, column: 5, scope: !562)
!565 = !MDLocation(line: 265, column: 5, scope: !562)
!566 = !MDLocation(line: 266, column: 3, scope: !546)
!567 = !MDLocation(line: 267, column: 31, scope: !568)
!568 = !{!"0xb\00267\0011\0046", !1, !542}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!569 = !MDLocation(line: 267, column: 12, scope: !568)
!570 = !MDLocation(line: 267, column: 11, scope: !542)
!571 = !MDLocation(line: 268, column: 4, scope: !568)
!572 = !MDLocation(line: 269, column: 33, scope: !573)
!573 = !{!"0xb\00269\0011\0047", !1, !568}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!574 = !MDLocation(line: 269, column: 12, scope: !573)
!575 = !MDLocation(line: 269, column: 11, scope: !568)
!576 = !{!"0x100\00ret\00271\000", !577, !175, !12} ; [ DW_TAG_auto_variable ] [ret] [line 271]
!577 = !{!"0xb\00270\005\0048", !1, !573}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!578 = !MDLocation(line: 271, column: 10, scope: !577)
!579 = !MDLocation(line: 271, column: 16, scope: !577)
!580 = !MDLocation(line: 271, column: 31, scope: !577)
!581 = !MDLocation(line: 272, column: 9, scope: !582)
!582 = !{!"0xb\00272\009\0049", !1, !577}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!583 = !MDLocation(line: 272, column: 9, scope: !577)
!584 = !MDLocation(line: 273, column: 7, scope: !582)
!585 = !MDLocation(line: 274, column: 14, scope: !586)
!586 = !{!"0xb\00274\0014\0050", !1, !582}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!587 = !MDLocation(line: 274, column: 14, scope: !582)
!588 = !MDLocation(line: 275, column: 7, scope: !586)
!589 = !MDLocation(line: 277, column: 6, scope: !586)
!590 = !MDLocation(line: 278, column: 5, scope: !577)
!591 = !MDLocation(line: 279, column: 31, scope: !592)
!592 = !{!"0xb\00279\0011\0051", !1, !573}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!593 = !MDLocation(line: 279, column: 12, scope: !592)
!594 = !MDLocation(line: 279, column: 11, scope: !573)
!595 = !MDLocation(line: 280, column: 4, scope: !592)
!596 = !MDLocation(line: 281, column: 36, scope: !597)
!597 = !{!"0xb\00281\0011\0052", !1, !592}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!598 = !MDLocation(line: 281, column: 12, scope: !597)
!599 = !MDLocation(line: 281, column: 11, scope: !592)
!600 = !MDLocation(line: 283, column: 9, scope: !601)
!601 = !{!"0xb\00283\007\0054", !1, !602}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!602 = !{!"0xb\00282\003\0053", !1, !597}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!603 = !MDLocation(line: 283, column: 7, scope: !602)
!604 = !MDLocation(line: 283, column: 28, scope: !605)
!605 = !{!"0xb\001", !1, !601}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!606 = !MDLocation(line: 283, column: 49, scope: !607)
!607 = !{!"0xb\002", !1, !601}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!608 = !MDLocation(line: 283, column: 68, scope: !609)
!609 = !{!"0xb\003", !1, !601}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!610 = !MDLocation(line: 284, column: 9, scope: !601)
!611 = !MDLocation(line: 284, column: 28, scope: !601)
!612 = !MDLocation(line: 284, column: 49, scope: !601)
!613 = !MDLocation(line: 284, column: 68, scope: !601)
!614 = !MDLocation(line: 285, column: 8, scope: !601)
!615 = !MDLocation(line: 285, column: 27, scope: !601)
!616 = !MDLocation(line: 285, column: 47, scope: !601)
!617 = !MDLocation(line: 287, column: 12, scope: !618)
!618 = !{!"0xb\00286\004\0055", !1, !601}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!619 = !MDLocation(line: 287, column: 5, scope: !618)
!620 = !MDLocation(line: 287, column: 5, scope: !621)
!621 = !{!"0xb\001", !1, !618}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!622 = !MDLocation(line: 287, column: 5, scope: !623)
!623 = !{!"0xb\002", !1, !618}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!624 = !MDLocation(line: 288, column: 12, scope: !618)
!625 = !MDLocation(line: 288, column: 5, scope: !621)
!626 = !MDLocation(line: 289, column: 5, scope: !618)
!627 = !MDLocation(line: 291, column: 9, scope: !628)
!628 = !{!"0xb\00291\008\0056", !1, !618}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!629 = !MDLocation(line: 291, column: 8, scope: !618)
!630 = !MDLocation(line: 291, column: 28, scope: !631)
!631 = !{!"0xb\001", !1, !628}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!632 = !MDLocation(line: 292, column: 7, scope: !628)
!633 = !MDLocation(line: 292, column: 26, scope: !628)
!634 = !MDLocation(line: 293, column: 6, scope: !628)
!635 = !MDLocation(line: 434, column: 1, scope: !618)
!636 = !MDLocation(line: 294, column: 14, scope: !637)
!637 = !{!"0xb\00294\0013\0057", !1, !628}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!638 = !MDLocation(line: 294, column: 13, scope: !628)
!639 = !MDLocation(line: 294, column: 33, scope: !640)
!640 = !{!"0xb\001", !1, !637}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!641 = !MDLocation(line: 295, column: 8, scope: !637)
!642 = !MDLocation(line: 295, column: 27, scope: !637)
!643 = !MDLocation(line: 297, column: 6, scope: !644)
!644 = !{!"0xb\00296\005\0058", !1, !637}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!645 = !MDLocation(line: 297, column: 25, scope: !644)
!646 = !MDLocation(line: 297, column: 35, scope: !644)
!647 = !MDLocation(line: 298, column: 6, scope: !644)
!648 = !MDLocation(line: 299, column: 6, scope: !644)
!649 = !MDLocation(line: 300, column: 5, scope: !644)
!650 = !MDLocation(line: 301, column: 14, scope: !651)
!651 = !{!"0xb\00301\0013\0059", !1, !637}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!652 = !MDLocation(line: 301, column: 13, scope: !637)
!653 = !MDLocation(line: 301, column: 33, scope: !654)
!654 = !{!"0xb\001", !1, !651}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!655 = !MDLocation(line: 302, column: 8, scope: !651)
!656 = !MDLocation(line: 302, column: 27, scope: !651)
!657 = !MDLocation(line: 303, column: 6, scope: !651)
!658 = !MDLocation(line: 304, column: 14, scope: !659)
!659 = !{!"0xb\00304\0013\0060", !1, !651}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!660 = !MDLocation(line: 304, column: 13, scope: !651)
!661 = !MDLocation(line: 304, column: 33, scope: !662)
!662 = !{!"0xb\001", !1, !659}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!663 = !MDLocation(line: 305, column: 8, scope: !659)
!664 = !MDLocation(line: 305, column: 27, scope: !659)
!665 = !MDLocation(line: 307, column: 6, scope: !666)
!666 = !{!"0xb\00306\005\0061", !1, !659}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!667 = !MDLocation(line: 307, column: 13, scope: !668)
!668 = !{!"0xb\002", !1, !669}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!669 = !{!"0xb\001", !1, !666}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!670 = !MDLocation(line: 307, column: 12, scope: !666)
!671 = !MDLocation(line: 309, column: 7, scope: !672)
!672 = !{!"0xb\00308\006\0062", !1, !666}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!673 = !MDLocation(line: 309, column: 26, scope: !672)
!674 = !MDLocation(line: 309, column: 36, scope: !672)
!675 = !MDLocation(line: 310, column: 7, scope: !672)
!676 = !MDLocation(line: 313, column: 6, scope: !666)
!677 = !MDLocation(line: 314, column: 5, scope: !666)
!678 = !MDLocation(line: 316, column: 6, scope: !659)
!679 = !MDLocation(line: 317, column: 4, scope: !618)
!680 = !MDLocation(line: 319, column: 5, scope: !601)
!681 = !MDLocation(line: 320, column: 3, scope: !602)
!682 = !MDLocation(line: 321, column: 34, scope: !683)
!683 = !{!"0xb\00321\0011\0063", !1, !597}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!684 = !MDLocation(line: 321, column: 12, scope: !683)
!685 = !MDLocation(line: 321, column: 11, scope: !597)
!686 = !MDLocation(line: 323, column: 5, scope: !687)
!687 = !{!"0xb\00322\003\0064", !1, !683}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!688 = !MDLocation(line: 324, column: 3, scope: !687)
!689 = !MDLocation(line: 325, column: 33, scope: !690)
!690 = !{!"0xb\00325\0011\0065", !1, !683}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!691 = !MDLocation(line: 325, column: 12, scope: !690)
!692 = !MDLocation(line: 325, column: 11, scope: !683)
!693 = !MDLocation(line: 326, column: 24, scope: !690)
!694 = !MDLocation(line: 326, column: 6, scope: !690)
!695 = !{!"0x100\00cp\00328\000", !696, !175, !49} ; [ DW_TAG_auto_variable ] [cp] [line 328]
!696 = !{!"0xb\00327\003\0066", !1, !690}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!697 = !MDLocation(line: 328, column: 11, scope: !696)
!698 = !MDLocation(line: 328, column: 16, scope: !696)
!699 = !MDLocation(line: 330, column: 27, scope: !700)
!700 = !{!"0xb\00330\008\0067", !1, !696}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!701 = !MDLocation(line: 330, column: 9, scope: !700)
!702 = !MDLocation(line: 330, column: 8, scope: !696)
!703 = !MDLocation(line: 331, column: 7, scope: !700)
!704 = !MDLocation(line: 333, column: 7, scope: !700)
!705 = !{!"0x100\00move\00335\000", !696, !175, !"_ZTS12HexxagonMove"} ; [ DW_TAG_auto_variable ] [move] [line 335]
!706 = !MDLocation(line: 335, column: 18, scope: !696)
!707 = !{!"0x100\00len\00337\000", !696, !175, !12} ; [ DW_TAG_auto_variable ] [len] [line 337]
!708 = !MDLocation(line: 337, column: 9, scope: !696)
!709 = !MDLocation(line: 337, column: 22, scope: !696)
!710 = !MDLocation(line: 337, column: 15, scope: !696)
!711 = !MDLocation(line: 338, column: 8, scope: !712)
!712 = !{!"0xb\00338\008\0068", !1, !696}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!713 = !MDLocation(line: 338, column: 8, scope: !696)
!714 = !MDLocation(line: 340, column: 30, scope: !715)
!715 = !{!"0xb\00339\005\0069", !1, !712}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!716 = !MDLocation(line: 340, column: 19, scope: !715)
!717 = !MDLocation(line: 340, column: 7, scope: !715)
!718 = !MDLocation(line: 341, column: 28, scope: !715)
!719 = !MDLocation(line: 341, column: 17, scope: !715)
!720 = !MDLocation(line: 341, column: 7, scope: !715)
!721 = !MDLocation(line: 342, column: 5, scope: !715)
!722 = !MDLocation(line: 342, column: 15, scope: !723)
!723 = !{!"0xb\00342\0015\0070", !1, !712}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!724 = !MDLocation(line: 342, column: 15, scope: !712)
!725 = !MDLocation(line: 344, column: 30, scope: !726)
!726 = !{!"0xb\00343\005\0071", !1, !723}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!727 = !MDLocation(line: 344, column: 19, scope: !726)
!728 = !MDLocation(line: 344, column: 7, scope: !726)
!729 = !MDLocation(line: 345, column: 28, scope: !726)
!730 = !MDLocation(line: 345, column: 17, scope: !726)
!731 = !MDLocation(line: 345, column: 7, scope: !726)
!732 = !MDLocation(line: 346, column: 5, scope: !726)
!733 = !MDLocation(line: 348, column: 7, scope: !723)
!734 = !MDLocation(line: 350, column: 8, scope: !735)
!735 = !{!"0xb\00350\008\0072", !1, !696}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!736 = !MDLocation(line: 350, column: 8, scope: !696)
!737 = !MDLocation(line: 350, column: 27, scope: !738)
!738 = !{!"0xb\001", !1, !735}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!739 = !MDLocation(line: 352, column: 10, scope: !740)
!740 = !{!"0xb\00352\0010\0074", !1, !741}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!741 = !{!"0xb\00351\005\0073", !1, !735}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!742 = !MDLocation(line: 352, column: 10, scope: !741)
!743 = !MDLocation(line: 354, column: 9, scope: !744)
!744 = !{!"0xb\00353\007\0075", !1, !740}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!745 = !MDLocation(line: 355, column: 9, scope: !744)
!746 = !MDLocation(line: 357, column: 12, scope: !747)
!747 = !{!"0xb\00357\0012\0076", !1, !744}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!748 = !MDLocation(line: 357, column: 12, scope: !744)
!749 = !MDLocation(line: 359, column: 8, scope: !750)
!750 = !{!"0xb\00358\009\0077", !1, !747}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!751 = !MDLocation(line: 359, column: 27, scope: !750)
!752 = !MDLocation(line: 359, column: 37, scope: !750)
!753 = !MDLocation(line: 360, column: 8, scope: !750)
!754 = !MDLocation(line: 361, column: 9, scope: !750)
!755 = !MDLocation(line: 362, column: 7, scope: !744)
!756 = !MDLocation(line: 364, column: 9, scope: !740)
!757 = !MDLocation(line: 365, column: 5, scope: !741)
!758 = !MDLocation(line: 368, column: 10, scope: !759)
!759 = !{!"0xb\00368\0010\0079", !1, !760}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!760 = !{!"0xb\00367\005\0078", !1, !735}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!761 = !MDLocation(line: 368, column: 10, scope: !760)
!762 = !MDLocation(line: 370, column: 12, scope: !763)
!763 = !{!"0xb\00370\0012\0081", !1, !764}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!764 = !{!"0xb\00369\007\0080", !1, !759}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!765 = !MDLocation(line: 370, column: 12, scope: !764)
!766 = !MDLocation(line: 371, column: 8, scope: !763)
!767 = !MDLocation(line: 373, column: 8, scope: !763)
!768 = !MDLocation(line: 374, column: 7, scope: !764)
!769 = !MDLocation(line: 375, column: 15, scope: !770)
!770 = !{!"0xb\00375\0015\0082", !1, !759}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!771 = !MDLocation(line: 375, column: 15, scope: !759)
!772 = !MDLocation(line: 376, column: 9, scope: !770)
!773 = !MDLocation(line: 378, column: 9, scope: !770)
!774 = !MDLocation(line: 380, column: 3, scope: !696)
!775 = !MDLocation(line: 381, column: 31, scope: !776)
!776 = !{!"0xb\00381\0011\0083", !1, !690}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!777 = !MDLocation(line: 381, column: 12, scope: !776)
!778 = !MDLocation(line: 381, column: 11, scope: !690)
!779 = !MDLocation(line: 382, column: 22, scope: !776)
!780 = !MDLocation(line: 382, column: 6, scope: !776)
!781 = !MDLocation(line: 384, column: 5, scope: !782)
!782 = !{!"0xb\00383\003\0084", !1, !776}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!783 = !MDLocation(line: 385, column: 3, scope: !782)
!784 = !MDLocation(line: 386, column: 34, scope: !785)
!785 = !{!"0xb\00386\0011\0085", !1, !776}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!786 = !MDLocation(line: 386, column: 12, scope: !785)
!787 = !MDLocation(line: 386, column: 11, scope: !776)
!788 = !MDLocation(line: 387, column: 24, scope: !785)
!789 = !MDLocation(line: 387, column: 6, scope: !785)
!790 = !{!"0x100\00cp\00389\000", !791, !175, !49} ; [ DW_TAG_auto_variable ] [cp] [line 389]
!791 = !{!"0xb\00388\003\0086", !1, !785}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!792 = !MDLocation(line: 389, column: 11, scope: !791)
!793 = !MDLocation(line: 389, column: 16, scope: !791)
!794 = !MDLocation(line: 391, column: 27, scope: !795)
!795 = !{!"0xb\00391\008\0087", !1, !791}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!796 = !MDLocation(line: 391, column: 9, scope: !795)
!797 = !MDLocation(line: 391, column: 8, scope: !791)
!798 = !MDLocation(line: 392, column: 7, scope: !795)
!799 = !MDLocation(line: 394, column: 7, scope: !795)
!800 = !{!"0x100\00move\00396\000", !791, !175, !"_ZTS12HexxagonMove"} ; [ DW_TAG_auto_variable ] [move] [line 396]
!801 = !MDLocation(line: 396, column: 18, scope: !791)
!802 = !MDLocation(line: 398, column: 15, scope: !803)
!803 = !{!"0xb\00398\008\0088", !1, !791}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!804 = !MDLocation(line: 398, column: 8, scope: !803)
!805 = !MDLocation(line: 398, column: 8, scope: !791)
!806 = !MDLocation(line: 400, column: 28, scope: !807)
!807 = !{!"0xb\00399\005\0089", !1, !803}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!808 = !MDLocation(line: 400, column: 17, scope: !807)
!809 = !MDLocation(line: 400, column: 7, scope: !807)
!810 = !MDLocation(line: 401, column: 19, scope: !807)
!811 = !MDLocation(line: 401, column: 7, scope: !807)
!812 = !MDLocation(line: 403, column: 10, scope: !813)
!813 = !{!"0xb\00403\0010\0090", !1, !807}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!814 = !MDLocation(line: 403, column: 10, scope: !807)
!815 = !MDLocation(line: 405, column: 12, scope: !816)
!816 = !{!"0xb\00405\0012\0092", !1, !817}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!817 = !{!"0xb\00404\007\0091", !1, !813}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!818 = !MDLocation(line: 405, column: 12, scope: !817)
!819 = !MDLocation(line: 407, column: 8, scope: !820)
!820 = !{!"0xb\00406\009\0093", !1, !816}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!821 = !MDLocation(line: 408, column: 8, scope: !820)
!822 = !MDLocation(line: 410, column: 11, scope: !823)
!823 = !{!"0xb\00410\0011\0094", !1, !820}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!824 = !MDLocation(line: 410, column: 11, scope: !820)
!825 = !MDLocation(line: 412, column: 10, scope: !826)
!826 = !{!"0xb\00411\008\0095", !1, !823}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!827 = !MDLocation(line: 412, column: 29, scope: !826)
!828 = !MDLocation(line: 412, column: 39, scope: !826)
!829 = !MDLocation(line: 413, column: 10, scope: !826)
!830 = !MDLocation(line: 414, column: 8, scope: !826)
!831 = !MDLocation(line: 415, column: 9, scope: !820)
!832 = !MDLocation(line: 417, column: 8, scope: !816)
!833 = !MDLocation(line: 418, column: 7, scope: !817)
!834 = !MDLocation(line: 420, column: 9, scope: !813)
!835 = !MDLocation(line: 421, column: 5, scope: !807)
!836 = !MDLocation(line: 423, column: 7, scope: !803)
!837 = !MDLocation(line: 425, column: 3, scope: !791)
!838 = !MDLocation(line: 426, column: 32, scope: !839)
!839 = !{!"0xb\00426\0011\0096", !1, !785}        ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!840 = !MDLocation(line: 426, column: 12, scope: !839)
!841 = !MDLocation(line: 426, column: 11, scope: !785)
!842 = !MDLocation(line: 427, column: 22, scope: !839)
!843 = !MDLocation(line: 427, column: 6, scope: !839)
!844 = !MDLocation(line: 429, column: 5, scope: !845)
!845 = !{!"0xb\00428\003\0097", !1, !839}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!846 = !MDLocation(line: 430, column: 3, scope: !845)
!847 = !MDLocation(line: 432, column: 4, scope: !839)
!848 = !MDLocation(line: 433, column: 2, scope: !380)
!849 = !MDLocation(line: 173, column: 39, scope: !377)
!850 = !MDLocation(line: 173, column: 2, scope: !377)
!851 = !MDLocation(line: 434, column: 1, scope: !852)
!852 = !{!"0xb\003", !1, !853}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!853 = !{!"0xb\002", !1, !368}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/hexxagon.cpp]
!854 = !{!"0x101\00this\0016777216\001088", !192, null, !364} ; [ DW_TAG_arg_variable ] [this] [line 0]
!855 = !MDLocation(line: 0, scope: !192)
!856 = !MDLocation(line: 61, column: 22, scope: !192)
!857 = !MDLocation(line: 61, column: 45, scope: !192)
!858 = !MDLocation(line: 61, column: 51, scope: !192)
!859 = !{!"0x101\00this\0016777216\001088", !191, null, !364} ; [ DW_TAG_arg_variable ] [this] [line 0]
!860 = !MDLocation(line: 0, scope: !191)
!861 = !MDLocation(line: 41, column: 19, scope: !862)
!862 = !{!"0xb\0041\0018\0099", !9, !191}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagongame.h]
!863 = !MDLocation(line: 41, column: 41, scope: !862)
!864 = !MDLocation(line: 41, column: 34, scope: !862)
!865 = !MDLocation(line: 41, column: 34, scope: !866)
!866 = !{!"0xb\002", !9, !862}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagongame.h]
!867 = !MDLocation(line: 41, column: 47, scope: !868)
!868 = !{!"0xb\003", !9, !869}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagongame.h]
!869 = !{!"0xb\001", !9, !191}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagongame.h]
!870 = !{!"0x101\00this\0016777216\001088", !190, null, !364} ; [ DW_TAG_arg_variable ] [this] [line 0]
!871 = !MDLocation(line: 0, scope: !190)
!872 = !MDLocation(line: 58, column: 26, scope: !190)
!873 = !MDLocation(line: 58, column: 19, scope: !190)
!874 = !{!"0x101\00this\0016777216\001088", !189, null, !875} ; [ DW_TAG_arg_variable ] [this] [line 0]
!875 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS12HexxagonMove"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS12HexxagonMove]
!876 = !MDLocation(line: 0, scope: !189)
!877 = !MDLocation(line: 35, column: 18, scope: !189)
!878 = !{!"0x101\00this\0016777216\001088", !188, null, !364} ; [ DW_TAG_arg_variable ] [this] [line 0]
!879 = !MDLocation(line: 0, scope: !188)
!880 = !{!"0x101\00move\0033554491\000", !188, !881, !31} ; [ DW_TAG_arg_variable ] [move] [line 59]
!881 = !{!"0x29", !9}                             ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/.hexxagon/./hexxagongame.h]
!882 = !MDLocation(line: 59, column: 32, scope: !188)
!883 = !MDLocation(line: 59, column: 46, scope: !188)
!884 = !MDLocation(line: 59, column: 39, scope: !188)
