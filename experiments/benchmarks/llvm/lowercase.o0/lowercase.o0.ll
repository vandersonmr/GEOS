; ModuleID = 'lowercase.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticData = internal global [16 x i16] [i16 72, i16 69, i16 76, i16 76, i16 79, i16 32, i16 87, i16 79, i16 82, i16 76, i16 68, i16 33, i16 72, i16 69, i16 76, i16 76], align 16
@.str = private unnamed_addr constant [29 x i8] c"iterations (%ld characters)\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i64, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !41, metadata !42), !dbg !43
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !44, metadata !42), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !42), !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64* %i, align 8, !dbg !50
  %cmp = icmp ult i64 %0, 32, !dbg !50
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %1 = load i64* %i, align 8, !dbg !55
  call void @doTest(i64 %1), !dbg !56
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %2 = load i64* %i, align 8, !dbg !57
  %inc = add i64 %2, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58

for.end:                                          ; preds = %for.cond
  ret i32 0, !dbg !59
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define internal void @doTest(i64 %numberOfIterations) #0 {
entry:
  %numberOfIterations.addr = alloca i64, align 8
  %numberOfCharacters = alloca i64, align 8
  %testDataLength = alloca i64, align 8
  %testData = alloca i16*, align 8
  %i = alloca i64, align 8
  %result = alloca i16*, align 8
  store i64 %numberOfIterations, i64* %numberOfIterations.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %numberOfIterations.addr, metadata !60, metadata !42), !dbg !61
  call void @llvm.dbg.declare(metadata i64* %numberOfCharacters, metadata !62, metadata !42), !dbg !63
  %0 = load i64* %numberOfIterations.addr, align 8, !dbg !64
  store i64 %0, i64* %numberOfCharacters, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata i64* %testDataLength, metadata !65, metadata !42), !dbg !66
  %1 = load i64* %numberOfCharacters, align 8, !dbg !67
  %add = add i64 %1, 16, !dbg !67
  %sub = sub i64 %add, 1, !dbg !67
  %div = udiv i64 %sub, 16, !dbg !68
  %mul = mul i64 %div, 16, !dbg !69
  store i64 %mul, i64* %testDataLength, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata i16** %testData, metadata !70, metadata !42), !dbg !71
  %2 = load i64* %testDataLength, align 8, !dbg !72
  %mul1 = mul i64 2, %2, !dbg !73
  %call = call i8* @malloc(i64 %mul1), !dbg !74
  %3 = bitcast i8* %call to i16*, !dbg !74
  store i16* %3, i16** %testData, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata i64* %i, metadata !75, metadata !42), !dbg !76
  store i64 0, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !77

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64* %i, align 8, !dbg !79
  %5 = load i64* %testDataLength, align 8, !dbg !83
  %cmp = icmp ult i64 %4, %5, !dbg !84
  br i1 %cmp, label %for.body, label %for.end, !dbg !85

for.body:                                         ; preds = %for.cond
  %6 = load i16** %testData, align 8, !dbg !86
  %7 = load i64* %i, align 8, !dbg !87
  %add.ptr = getelementptr inbounds i16* %6, i64 %7, !dbg !86
  %8 = bitcast i16* %add.ptr to i8*, !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* bitcast ([16 x i16]* @staticData to i8*), i64 32, i32 2, i1 false), !dbg !88
  br label %for.inc, !dbg !88

for.inc:                                          ; preds = %for.body
  %9 = load i64* %i, align 8, !dbg !89
  %add2 = add i64 %9, 16, !dbg !89
  store i64 %add2, i64* %i, align 8, !dbg !89
  br label %for.cond, !dbg !90

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i16** %result, metadata !91, metadata !42), !dbg !92
  %10 = load i64* %testDataLength, align 8, !dbg !93
  %mul3 = mul i64 2, %10, !dbg !94
  %call4 = call i8* @malloc(i64 %mul3), !dbg !95
  %11 = bitcast i8* %call4 to i16*, !dbg !95
  store i16* %11, i16** %result, align 8, !dbg !92
  %12 = load i64* %numberOfIterations.addr, align 8, !dbg !96
  %13 = load i64* %numberOfCharacters, align 8, !dbg !97
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str, i32 0, i32 0), i64 %12, i64 %13), !dbg !98
  %14 = load i16** %result, align 8, !dbg !99
  %15 = bitcast i16* %14 to i8*, !dbg !100
  %16 = load i64* %testDataLength, align 8, !dbg !101
  %mul6 = mul i64 2, %16, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* %15, i8 0, i64 %mul6, i32 2, i1 false), !dbg !100
  store i64 0, i64* %i, align 8, !dbg !103
  br label %for.cond7, !dbg !103

for.cond7:                                        ; preds = %for.inc11, %for.end
  %17 = load i64* %i, align 8, !dbg !105
  %cmp8 = icmp ult i64 %17, 10000000, !dbg !105
  br i1 %cmp8, label %for.body9, label %for.end12, !dbg !109

for.body9:                                        ; preds = %for.cond7
  %18 = load i16** %testData, align 8, !dbg !110
  %19 = load i64* %numberOfCharacters, align 8, !dbg !111
  %20 = load i16** %result, align 8, !dbg !112
  %call10 = call i64 @lower_StringImpl(i16* %18, i64 %19, i16* %20), !dbg !113
  br label %for.inc11, !dbg !113

for.inc11:                                        ; preds = %for.body9
  %21 = load i64* %i, align 8, !dbg !114
  %inc = add i64 %21, 1, !dbg !114
  store i64 %inc, i64* %i, align 8, !dbg !114
  br label %for.cond7, !dbg !115

for.end12:                                        ; preds = %for.cond7
  ret void, !dbg !116
}

declare i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define internal i64 @lower_StringImpl(i16* noalias %data, i64 %length, i16* noalias %output) #0 {
entry:
  %retval = alloca i64, align 8
  %data.addr = alloca i16*, align 8
  %length.addr = alloca i64, align 8
  %output.addr = alloca i16*, align 8
  %ored = alloca i16, align 2
  %i = alloca i64, align 8
  %c = alloca i16, align 2
  store i16* %data, i16** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i16** %data.addr, metadata !117, metadata !42), !dbg !118
  store i64 %length, i64* %length.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %length.addr, metadata !119, metadata !42), !dbg !120
  store i16* %output, i16** %output.addr, align 8
  call void @llvm.dbg.declare(metadata i16** %output.addr, metadata !121, metadata !42), !dbg !122
  call void @llvm.dbg.declare(metadata i16* %ored, metadata !123, metadata !42), !dbg !124
  store i16 0, i16* %ored, align 2, !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !42), !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !127

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64* %i, align 8, !dbg !129
  %1 = load i64* %length.addr, align 8, !dbg !133
  %cmp = icmp ult i64 %0, %1, !dbg !134
  br i1 %cmp, label %for.body, label %for.end, !dbg !135

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i16* %c, metadata !136, metadata !42), !dbg !138
  %2 = load i64* %i, align 8, !dbg !139
  %3 = load i16** %data.addr, align 8, !dbg !140
  %arrayidx = getelementptr inbounds i16* %3, i64 %2, !dbg !140
  %4 = load i16* %arrayidx, align 2, !dbg !140
  store i16 %4, i16* %c, align 2, !dbg !138
  %5 = load i16* %c, align 2, !dbg !141
  %conv = zext i16 %5 to i32, !dbg !141
  %6 = load i16* %ored, align 2, !dbg !142
  %conv1 = zext i16 %6 to i32, !dbg !142
  %or = or i32 %conv1, %conv, !dbg !142
  %conv2 = trunc i32 %or to i16, !dbg !142
  store i16 %conv2, i16* %ored, align 2, !dbg !142
  %7 = load i16* %c, align 2, !dbg !143
  %call = call zeroext i16 @toASCIILower(i16 zeroext %7), !dbg !144
  %8 = load i64* %i, align 8, !dbg !145
  %9 = load i16** %output.addr, align 8, !dbg !146
  %arrayidx3 = getelementptr inbounds i16* %9, i64 %8, !dbg !146
  store i16 %call, i16* %arrayidx3, align 2, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %10 = load i64* %i, align 8, !dbg !148
  %inc = add i64 %10, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149

for.end:                                          ; preds = %for.cond
  %11 = load i16* %ored, align 2, !dbg !150
  %conv4 = zext i16 %11 to i32, !dbg !150
  %and = and i32 %conv4, -128, !dbg !150
  %tobool = icmp ne i32 %and, 0, !dbg !152
  br i1 %tobool, label %if.end, label %if.then, !dbg !152

if.then:                                          ; preds = %for.end
  store i64 1, i64* %retval, !dbg !153
  br label %return, !dbg !153

if.end:                                           ; preds = %for.end
  store i64 0, i64* %retval, !dbg !154
  br label %return, !dbg !154

return:                                           ; preds = %if.end, %if.then
  %12 = load i64* %retval, !dbg !155
  ret i64 %12, !dbg !155
}

; Function Attrs: inlinehint nounwind uwtable
define internal zeroext i16 @toASCIILower(i16 zeroext %c) #4 {
entry:
  %c.addr = alloca i16, align 2
  store i16 %c, i16* %c.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %c.addr, metadata !156, metadata !42), !dbg !157
  %0 = load i16* %c.addr, align 2, !dbg !158
  %conv = zext i16 %0 to i32, !dbg !158
  %1 = load i16* %c.addr, align 2, !dbg !159
  %conv1 = zext i16 %1 to i32, !dbg !159
  %cmp = icmp sge i32 %conv1, 65, !dbg !159
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !159

land.rhs:                                         ; preds = %entry
  %2 = load i16* %c.addr, align 2, !dbg !160
  %conv3 = zext i16 %2 to i32, !dbg !160
  %cmp4 = icmp sle i32 %conv3, 90, !dbg !160
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %cmp4, %land.rhs ]
  %land.ext = zext i1 %3 to i32, !dbg !162
  %shl = shl i32 %land.ext, 5, !dbg !164
  %or = or i32 %conv, %shl, !dbg !158
  %conv6 = trunc i32 %or to i16, !dbg !158
  ret i16 %conv6, !dbg !165
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!38, !39}
!llvm.ident = !{!40}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\000\00\000\00\001", !1, !2, !2, !3, !31, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c] [DW_LANG_C99]
!1 = !{!"lowercase.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !12, !18, !28}
!4 = !{!"0x2e\00main\00main\00\0051\000\001\000\000\00256\000\0052", !1, !5, !6, null, i32 (i32, i8**)* @main, null, null, !2} ; [ DW_TAG_subprogram ] [line 51] [def] [scope 52] [main]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !8, !9}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0xf\00\000\0064\0064\000\000", null, null, !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!11 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!12 = !{!"0x2e\00doTest\00doTest\00\0030\001\001\000\000\00256\000\0031", !1, !5, !13, null, void (i64)* @doTest, null, null, !2} ; [ DW_TAG_subprogram ] [line 30] [local] [def] [scope 31] [doTest]
!13 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !14, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!14 = !{null, !15}
!15 = !{!"0x16\00size_t\0062\000\000\000\000", !16, null, !17} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!16 = !{!"/usr/local/bin/../lib/clang/3.6.0/include/stddef.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!17 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!18 = !{!"0x2e\00lower_StringImpl\00lower_StringImpl\00\0011\001\001\000\000\00256\000\0012", !1, !5, !19, null, i64 (i16*, i64, i16*)* @lower_StringImpl, null, null, !2} ; [ DW_TAG_subprogram ] [line 11] [local] [def] [scope 12] [lower_StringImpl]
!19 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !20, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = !{!15, !21, !15, !26}
!21 = !{!"0x37\00\000\000\000\000\000", null, null, !22} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = !{!"0xf\00\000\0064\0064\000\000", null, null, !23} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!23 = !{!"0x26\00\000\000\000\000\000", null, null, !24} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from UChar]
!24 = !{!"0x16\00UChar\006\000\000\000\000", !1, null, !25} ; [ DW_TAG_typedef ] [UChar] [line 6, size 0, align 0, offset 0] [from unsigned short]
!25 = !{!"0x24\00unsigned short\000\0016\0016\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!26 = !{!"0x37\00\000\000\000\000\000", null, null, !27} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = !{!"0xf\00\000\0064\0064\000\000", null, null, !24} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from UChar]
!28 = !{!"0x2e\00toASCIILower\00toASCIILower\00\008\001\001\000\000\00256\000\008", !1, !5, !29, null, i16 (i16)* @toASCIILower, null, null, !2} ; [ DW_TAG_subprogram ] [line 8] [local] [def] [toASCIILower]
!29 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !30, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = !{!24, !24}
!31 = !{!32, !34}
!32 = !{!"0x34\00staticDataLength\00staticDataLength\00\0028\001\001", null, !5, !33, i64 16, null} ; [ DW_TAG_variable ] [staticDataLength] [line 28] [local] [def]
!33 = !{!"0x26\00\000\000\000\000\000", null, null, !15} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from size_t]
!34 = !{!"0x34\00staticData\00staticData\00\0027\001\001", null, !5, !35, [16 x i16]* @staticData, null} ; [ DW_TAG_variable ] [staticData] [line 27] [local] [def]
!35 = !{!"0x1\00\000\00256\0016\000\000\000", null, null, !24, !36, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 16, offset 0] [from UChar]
!36 = !{!37}
!37 = !{!"0x21\000\0016"}                         ; [ DW_TAG_subrange_type ] [0, 15]
!38 = !{i32 2, !"Dwarf Version", i32 4}
!39 = !{i32 2, !"Debug Info Version", i32 2}
!40 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!41 = !{!"0x101\00argc\0016777267\000", !4, !5, !8} ; [ DW_TAG_arg_variable ] [argc] [line 51]
!42 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!43 = !MDLocation(line: 51, column: 14, scope: !4)
!44 = !{!"0x101\00argv\0033554483\000", !4, !5, !9} ; [ DW_TAG_arg_variable ] [argv] [line 51]
!45 = !MDLocation(line: 51, column: 27, scope: !4)
!46 = !{!"0x100\00i\0053\000", !4, !5, !15}       ; [ DW_TAG_auto_variable ] [i] [line 53]
!47 = !MDLocation(line: 53, column: 10, scope: !4)
!48 = !MDLocation(line: 54, column: 8, scope: !49)
!49 = !{!"0xb\0054\003\000", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!50 = !MDLocation(line: 54, column: 15, scope: !51)
!51 = !{!"0xb\002", !1, !52}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!52 = !{!"0xb\001", !1, !53}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!53 = !{!"0xb\0054\003\001", !1, !49}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!54 = !MDLocation(line: 54, column: 3, scope: !49)
!55 = !MDLocation(line: 55, column: 12, scope: !53)
!56 = !MDLocation(line: 55, column: 5, scope: !53)
!57 = !MDLocation(line: 54, column: 23, scope: !53)
!58 = !MDLocation(line: 54, column: 3, scope: !53)
!59 = !MDLocation(line: 57, column: 3, scope: !4)
!60 = !{!"0x101\00numberOfIterations\0016777246\000", !12, !5, !15} ; [ DW_TAG_arg_variable ] [numberOfIterations] [line 30]
!61 = !MDLocation(line: 30, column: 27, scope: !12)
!62 = !{!"0x100\00numberOfCharacters\0032\000", !12, !5, !33} ; [ DW_TAG_auto_variable ] [numberOfCharacters] [line 32]
!63 = !MDLocation(line: 32, column: 16, scope: !12)
!64 = !MDLocation(line: 32, column: 37, scope: !12)
!65 = !{!"0x100\00testDataLength\0033\000", !12, !5, !33} ; [ DW_TAG_auto_variable ] [testDataLength] [line 33]
!66 = !MDLocation(line: 33, column: 16, scope: !12)
!67 = !MDLocation(line: 33, column: 35, scope: !12)
!68 = !MDLocation(line: 33, column: 34, scope: !12)
!69 = !MDLocation(line: 33, column: 33, scope: !12)
!70 = !{!"0x100\00testData\0034\000", !12, !5, !27} ; [ DW_TAG_auto_variable ] [testData] [line 34]
!71 = !MDLocation(line: 34, column: 10, scope: !12)
!72 = !MDLocation(line: 34, column: 44, scope: !12)
!73 = !MDLocation(line: 34, column: 28, scope: !12)
!74 = !MDLocation(line: 34, column: 21, scope: !12)
!75 = !{!"0x100\00i\0035\000", !12, !5, !15}      ; [ DW_TAG_auto_variable ] [i] [line 35]
!76 = !MDLocation(line: 35, column: 10, scope: !12)
!77 = !MDLocation(line: 36, column: 8, scope: !78)
!78 = !{!"0xb\0036\003\002", !1, !12}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!79 = !MDLocation(line: 36, column: 15, scope: !80)
!80 = !{!"0xb\002", !1, !81}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!81 = !{!"0xb\001", !1, !82}                      ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!82 = !{!"0xb\0036\003\003", !1, !78}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!83 = !MDLocation(line: 36, column: 19, scope: !82)
!84 = !MDLocation(line: 36, column: 15, scope: !82)
!85 = !MDLocation(line: 36, column: 3, scope: !78)
!86 = !MDLocation(line: 37, column: 12, scope: !82)
!87 = !MDLocation(line: 37, column: 23, scope: !82)
!88 = !MDLocation(line: 37, column: 5, scope: !82)
!89 = !MDLocation(line: 36, column: 35, scope: !82)
!90 = !MDLocation(line: 36, column: 3, scope: !82)
!91 = !{!"0x100\00result\0039\000", !12, !5, !27} ; [ DW_TAG_auto_variable ] [result] [line 39]
!92 = !MDLocation(line: 39, column: 10, scope: !12)
!93 = !MDLocation(line: 39, column: 42, scope: !12)
!94 = !MDLocation(line: 39, column: 26, scope: !12)
!95 = !MDLocation(line: 39, column: 19, scope: !12)
!96 = !MDLocation(line: 40, column: 43, scope: !12)
!97 = !MDLocation(line: 40, column: 63, scope: !12)
!98 = !MDLocation(line: 40, column: 3, scope: !12)
!99 = !MDLocation(line: 42, column: 10, scope: !12)
!100 = !MDLocation(line: 42, column: 3, scope: !12)
!101 = !MDLocation(line: 42, column: 37, scope: !12)
!102 = !MDLocation(line: 42, column: 21, scope: !12)
!103 = !MDLocation(line: 46, column: 8, scope: !104)
!104 = !{!"0xb\0046\003\004", !1, !12}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!105 = !MDLocation(line: 46, column: 15, scope: !106)
!106 = !{!"0xb\002", !1, !107}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!107 = !{!"0xb\001", !1, !108}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!108 = !{!"0xb\0046\003\005", !1, !104}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!109 = !MDLocation(line: 46, column: 3, scope: !104)
!110 = !MDLocation(line: 48, column: 22, scope: !108)
!111 = !MDLocation(line: 48, column: 32, scope: !108)
!112 = !MDLocation(line: 48, column: 52, scope: !108)
!113 = !MDLocation(line: 48, column: 5, scope: !108)
!114 = !MDLocation(line: 46, column: 29, scope: !108)
!115 = !MDLocation(line: 46, column: 3, scope: !108)
!116 = !MDLocation(line: 49, column: 1, scope: !12)
!117 = !{!"0x101\00data\0016777227\000", !18, !5, !21} ; [ DW_TAG_arg_variable ] [data] [line 11]
!118 = !MDLocation(line: 11, column: 56, scope: !18)
!119 = !{!"0x101\00length\0033554443\000", !18, !5, !15} ; [ DW_TAG_arg_variable ] [length] [line 11]
!120 = !MDLocation(line: 11, column: 69, scope: !18)
!121 = !{!"0x101\00output\0050331659\000", !18, !5, !26} ; [ DW_TAG_arg_variable ] [output] [line 11]
!122 = !MDLocation(line: 11, column: 95, scope: !18)
!123 = !{!"0x100\00ored\0014\000", !18, !5, !24}  ; [ DW_TAG_auto_variable ] [ored] [line 14]
!124 = !MDLocation(line: 14, column: 9, scope: !18)
!125 = !{!"0x100\00i\0015\000", !18, !5, !15}     ; [ DW_TAG_auto_variable ] [i] [line 15]
!126 = !MDLocation(line: 15, column: 10, scope: !18)
!127 = !MDLocation(line: 16, column: 8, scope: !128)
!128 = !{!"0xb\0016\003\006", !1, !18}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!129 = !MDLocation(line: 16, column: 15, scope: !130)
!130 = !{!"0xb\002", !1, !131}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!131 = !{!"0xb\001", !1, !132}                    ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!132 = !{!"0xb\0016\003\007", !1, !128}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!133 = !MDLocation(line: 16, column: 19, scope: !132)
!134 = !MDLocation(line: 16, column: 15, scope: !132)
!135 = !MDLocation(line: 16, column: 3, scope: !128)
!136 = !{!"0x100\00c\0017\000", !137, !5, !24}    ; [ DW_TAG_auto_variable ] [c] [line 17]
!137 = !{!"0xb\0016\0032\008", !1, !132}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!138 = !MDLocation(line: 17, column: 11, scope: !137)
!139 = !MDLocation(line: 17, column: 20, scope: !137)
!140 = !MDLocation(line: 17, column: 15, scope: !137)
!141 = !MDLocation(line: 18, column: 13, scope: !137)
!142 = !MDLocation(line: 18, column: 5, scope: !137)
!143 = !MDLocation(line: 19, column: 30, scope: !137)
!144 = !MDLocation(line: 19, column: 17, scope: !137)
!145 = !MDLocation(line: 19, column: 12, scope: !137)
!146 = !MDLocation(line: 19, column: 5, scope: !137)
!147 = !MDLocation(line: 20, column: 3, scope: !137)
!148 = !MDLocation(line: 16, column: 27, scope: !132)
!149 = !MDLocation(line: 16, column: 3, scope: !132)
!150 = !MDLocation(line: 21, column: 9, scope: !151)
!151 = !{!"0xb\0021\007\009", !1, !18}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!152 = !MDLocation(line: 21, column: 7, scope: !18)
!153 = !MDLocation(line: 22, column: 5, scope: !151)
!154 = !MDLocation(line: 24, column: 3, scope: !18)
!155 = !MDLocation(line: 25, column: 1, scope: !18)
!156 = !{!"0x101\00c\0016777224\000", !28, !5, !24} ; [ DW_TAG_arg_variable ] [c] [line 8]
!157 = !MDLocation(line: 8, column: 40, scope: !28)
!158 = !MDLocation(line: 8, column: 52, scope: !28)
!159 = !MDLocation(line: 8, column: 58, scope: !28)
!160 = !MDLocation(line: 8, column: 70, scope: !161)
!161 = !{!"0xb\001", !1, !28}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!162 = !MDLocation(line: 8, column: 58, scope: !163)
!163 = !{!"0xb\002", !1, !28}                     ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/lowercase.c]
!164 = !MDLocation(line: 8, column: 57, scope: !28)
!165 = !MDLocation(line: 8, column: 45, scope: !28)
