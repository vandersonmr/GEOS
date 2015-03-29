; ModuleID = 'fp-convert.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"Total is %g\0A\00", align 1

; Function Attrs: nounwind readonly uwtable
define double @loop(float* nocapture readonly %x, float* nocapture readonly %y, i64 %length) #0 {
entry:
  tail call void @llvm.dbg.value(metadata float* %x, i64 0, metadata !14, metadata !42), !dbg !43
  tail call void @llvm.dbg.value(metadata float* %y, i64 0, metadata !15, metadata !42), !dbg !44
  tail call void @llvm.dbg.value(metadata i64 %length, i64 0, metadata !16, metadata !42), !dbg !45
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !18, metadata !42), !dbg !46
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !17, metadata !42), !dbg !47
  %cmp7 = icmp sgt i64 %length, 0, !dbg !48
  br i1 %cmp7, label %for.body.lr.ph, label %for.end, !dbg !51

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i64 %length, -1, !dbg !51
  br label %for.body, !dbg !51

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %accumulator.09 = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %add, %for.body ]
  %i.08 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds float* %x, i64 %i.08, !dbg !52
  %1 = load float* %arrayidx, align 4, !dbg !52, !tbaa !54
  %conv = fpext float %1 to double, !dbg !58
  %arrayidx1 = getelementptr inbounds float* %y, i64 %i.08, !dbg !59
  %2 = load float* %arrayidx1, align 4, !dbg !59, !tbaa !54
  %conv2 = fpext float %2 to double, !dbg !60
  %mul = fmul double %conv, %conv2, !dbg !58
  %add = fadd double %accumulator.09, %mul, !dbg !61
  tail call void @llvm.dbg.value(metadata double %add, i64 0, metadata !18, metadata !42), !dbg !46
  %inc = add nuw nsw i64 %i.08, 1, !dbg !62
  tail call void @llvm.dbg.value(metadata i64 %inc, i64 0, metadata !17, metadata !42), !dbg !47
  %exitcond = icmp eq i64 %i.08, %0, !dbg !51
  br i1 %exitcond, label %for.end, label %for.body, !dbg !51

for.end:                                          ; preds = %for.body, %entry
  %accumulator.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add, %for.body ]
  ret double %accumulator.0.lcssa, !dbg !63
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #2 {
entry:
  %x = alloca [2048 x float], align 16
  %y = alloca [2048 x float], align 16
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !27, metadata !42), !dbg !64
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !28, metadata !42), !dbg !65
  %0 = bitcast [2048 x float]* %x to i8*, !dbg !66
  call void @llvm.lifetime.start(i64 8192, i8* %0) #3, !dbg !66
  tail call void @llvm.dbg.declare(metadata [2048 x float]* %x, metadata !31, metadata !42), !dbg !67
  %1 = bitcast [2048 x float]* %y to i8*, !dbg !68
  call void @llvm.lifetime.start(i64 8192, i8* %1) #3, !dbg !68
  tail call void @llvm.dbg.declare(metadata [2048 x float]* %y, metadata !35, metadata !42), !dbg !69
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !36, metadata !42), !dbg !70
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !37, metadata !42), !dbg !71
  tail call void @llvm.dbg.value(metadata float 1.000000e+00, i64 0, metadata !38, metadata !42), !dbg !72
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !29, metadata !42), !dbg !73
  %arraydecay = getelementptr inbounds [2048 x float]* %x, i64 0, i64 0, !dbg !74
  %arraydecay10 = getelementptr inbounds [2048 x float]* %y, i64 0, i64 0, !dbg !78
  br label %for.body, !dbg !79

for.body:                                         ; preds = %for.end, %entry
  %b.030 = phi float [ 1.000000e+00, %entry ], [ %b.1, %for.end ]
  %a.029 = phi float [ 0.000000e+00, %entry ], [ %a.1, %for.end ]
  %total.028 = phi double [ 0.000000e+00, %entry ], [ %add11, %for.end ]
  %i.027 = phi i32 [ 0, %entry ], [ %inc13, %for.end ]
  %rem = srem i32 %i.027, 10, !dbg !80
  %tobool = icmp eq i32 %rem, 0, !dbg !82
  br i1 %tobool, label %if.else, label %if.end, !dbg !82

if.else:                                          ; preds = %for.body
  %add = fadd float %a.029, 0x3FB99999A0000000, !dbg !83
  tail call void @llvm.dbg.value(metadata float %add, i64 0, metadata !37, metadata !42), !dbg !71
  %add1 = fadd float %b.030, 0x3FC99999A0000000, !dbg !85
  tail call void @llvm.dbg.value(metadata float %add1, i64 0, metadata !38, metadata !42), !dbg !72
  br label %if.end

if.end:                                           ; preds = %for.body, %if.else
  %a.1 = phi float [ %add, %if.else ], [ 0.000000e+00, %for.body ]
  %b.1 = phi float [ %add1, %if.else ], [ 1.000000e+00, %for.body ]
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !30, metadata !42), !dbg !86
  br label %for.body4, !dbg !87

for.body4:                                        ; preds = %for.body4, %if.end
  %indvars.iv = phi i64 [ 0, %if.end ], [ %indvars.iv.next, %for.body4 ]
  %2 = trunc i64 %indvars.iv to i32, !dbg !89
  %conv = sitofp i32 %2 to float, !dbg !89
  %add5 = fadd float %a.1, %conv, !dbg !92
  %arrayidx = getelementptr inbounds [2048 x float]* %x, i64 0, i64 %indvars.iv, !dbg !93
  store float %add5, float* %arrayidx, align 4, !dbg !93, !tbaa !54
  %add7 = fadd float %b.1, %conv, !dbg !94
  %arrayidx9 = getelementptr inbounds [2048 x float]* %y, i64 0, i64 %indvars.iv, !dbg !95
  store float %add7, float* %arrayidx9, align 4, !dbg !95, !tbaa !54
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !87
  %exitcond = icmp eq i64 %indvars.iv.next, 2048, !dbg !87
  br i1 %exitcond, label %for.end, label %for.body4, !dbg !87

for.end:                                          ; preds = %for.body4
  %call = call double @loop(float* %arraydecay, float* %arraydecay10, i64 2048), !dbg !96
  %add11 = fadd double %total.028, %call, !dbg !97
  tail call void @llvm.dbg.value(metadata double %add11, i64 0, metadata !36, metadata !42), !dbg !70
  %inc13 = add nuw nsw i32 %i.027, 1, !dbg !98
  tail call void @llvm.dbg.value(metadata i32 %inc13, i64 0, metadata !29, metadata !42), !dbg !73
  %exitcond31 = icmp eq i32 %inc13, 500000, !dbg !79
  br i1 %exitcond31, label %for.end14, label %for.body, !dbg !79

for.end14:                                        ; preds = %for.end
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), double %add11) #3, !dbg !99
  call void @llvm.lifetime.end(i64 8192, i8* %1) #3, !dbg !100
  call void @llvm.lifetime.end(i64 8192, i8* %0) #3, !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #4

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #3

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!39, !40}
!llvm.ident = !{!41}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !6, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c] [DW_LANG_C99]
!1 = !{!"fp-convert.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5}
!4 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!5 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!6 = !{!7, !19}
!7 = !{!"0x2e\00loop\00loop\00\004\000\001\000\000\00256\001\004", !1, !8, !9, null, double (float*, float*, i64)* @loop, null, null, !13} ; [ DW_TAG_subprogram ] [line 4] [def] [loop]
!8 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!9 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !10, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = !{!4, !11, !11, !12}
!11 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!12 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!13 = !{!14, !15, !16, !17, !18}
!14 = !{!"0x101\00x\0016777220\000", !7, !8, !11} ; [ DW_TAG_arg_variable ] [x] [line 4]
!15 = !{!"0x101\00y\0033554436\000", !7, !8, !11} ; [ DW_TAG_arg_variable ] [y] [line 4]
!16 = !{!"0x101\00length\0050331652\000", !7, !8, !12} ; [ DW_TAG_arg_variable ] [length] [line 4]
!17 = !{!"0x100\00i\005\000", !7, !8, !12}        ; [ DW_TAG_auto_variable ] [i] [line 5]
!18 = !{!"0x100\00accumulator\006\000", !7, !8, !4} ; [ DW_TAG_auto_variable ] [accumulator] [line 6]
!19 = !{!"0x2e\00main\00main\00\0019\000\001\000\000\00256\001\0019", !1, !8, !20, null, i32 (i32, i8**)* @main, null, null, !26} ; [ DW_TAG_subprogram ] [line 19] [def] [main]
!20 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !21, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!21 = !{!22, !22, !23}
!22 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!23 = !{!"0xf\00\000\0064\0064\000\000", null, null, !24} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!24 = !{!"0xf\00\000\0064\0064\000\000", null, null, !25} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!25 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!26 = !{!27, !28, !29, !30, !31, !35, !36, !37, !38}
!27 = !{!"0x101\00argc\0016777235\000", !19, !8, !22} ; [ DW_TAG_arg_variable ] [argc] [line 19]
!28 = !{!"0x101\00argv\0033554451\000", !19, !8, !23} ; [ DW_TAG_arg_variable ] [argv] [line 19]
!29 = !{!"0x100\00i\0020\000", !19, !8, !22}      ; [ DW_TAG_auto_variable ] [i] [line 20]
!30 = !{!"0x100\00j\0020\000", !19, !8, !22}      ; [ DW_TAG_auto_variable ] [j] [line 20]
!31 = !{!"0x100\00x\0021\000", !19, !8, !32}      ; [ DW_TAG_auto_variable ] [x] [line 21]
!32 = !{!"0x1\00\000\0065536\0032\000\000\000", null, null, !5, !33, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 65536, align 32, offset 0] [from float]
!33 = !{!34}
!34 = !{!"0x21\000\002048"}                       ; [ DW_TAG_subrange_type ] [0, 2047]
!35 = !{!"0x100\00y\0022\000", !19, !8, !32}      ; [ DW_TAG_auto_variable ] [y] [line 22]
!36 = !{!"0x100\00total\0023\000", !19, !8, !4}   ; [ DW_TAG_auto_variable ] [total] [line 23]
!37 = !{!"0x100\00a\0024\000", !19, !8, !5}       ; [ DW_TAG_auto_variable ] [a] [line 24]
!38 = !{!"0x100\00b\0025\000", !19, !8, !5}       ; [ DW_TAG_auto_variable ] [b] [line 25]
!39 = !{i32 2, !"Dwarf Version", i32 4}
!40 = !{i32 2, !"Debug Info Version", i32 2}
!41 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!42 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!43 = !MDLocation(line: 4, column: 20, scope: !7)
!44 = !MDLocation(line: 4, column: 30, scope: !7)
!45 = !MDLocation(line: 4, column: 38, scope: !7)
!46 = !MDLocation(line: 6, column: 10, scope: !7)
!47 = !MDLocation(line: 5, column: 8, scope: !7)
!48 = !MDLocation(line: 7, column: 13, scope: !49)
!49 = !{!"0xb\007\003\001", !1, !50}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!50 = !{!"0xb\007\003\000", !1, !7}               ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!51 = !MDLocation(line: 7, column: 3, scope: !50)
!52 = !MDLocation(line: 8, column: 28, scope: !53)
!53 = !{!"0xb\007\0028\002", !1, !49}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!54 = !{!55, !55, i64 0}
!55 = !{!"float", !56, i64 0}
!56 = !{!"omnipotent char", !57, i64 0}
!57 = !{!"Simple C/C++ TBAA"}
!58 = !MDLocation(line: 8, column: 20, scope: !53)
!59 = !MDLocation(line: 8, column: 43, scope: !53)
!60 = !MDLocation(line: 8, column: 35, scope: !53)
!61 = !MDLocation(line: 8, column: 5, scope: !53)
!62 = !MDLocation(line: 7, column: 23, scope: !49)
!63 = !MDLocation(line: 10, column: 3, scope: !7)
!64 = !MDLocation(line: 19, column: 14, scope: !19)
!65 = !MDLocation(line: 19, column: 26, scope: !19)
!66 = !MDLocation(line: 21, column: 3, scope: !19)
!67 = !MDLocation(line: 21, column: 9, scope: !19)
!68 = !MDLocation(line: 22, column: 3, scope: !19)
!69 = !MDLocation(line: 22, column: 9, scope: !19)
!70 = !MDLocation(line: 23, column: 10, scope: !19)
!71 = !MDLocation(line: 24, column: 9, scope: !19)
!72 = !MDLocation(line: 25, column: 9, scope: !19)
!73 = !MDLocation(line: 20, column: 7, scope: !19)
!74 = !MDLocation(line: 39, column: 19, scope: !75)
!75 = !{!"0xb\0027\0027\005", !1, !76}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!76 = !{!"0xb\0027\003\004", !1, !77}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!77 = !{!"0xb\0027\003\003", !1, !19}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!78 = !MDLocation(line: 39, column: 22, scope: !75)
!79 = !MDLocation(line: 27, column: 3, scope: !77)
!80 = !MDLocation(line: 28, column: 9, scope: !81)
!81 = !{!"0xb\0028\009\006", !1, !75}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!82 = !MDLocation(line: 28, column: 9, scope: !75)
!83 = !MDLocation(line: 32, column: 7, scope: !84)
!84 = !{!"0xb\0031\0012\008", !1, !81}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!85 = !MDLocation(line: 33, column: 7, scope: !84)
!86 = !MDLocation(line: 20, column: 10, scope: !19)
!87 = !MDLocation(line: 35, column: 5, scope: !88)
!88 = !{!"0xb\0035\005\009", !1, !75}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!89 = !MDLocation(line: 36, column: 18, scope: !90)
!90 = !{!"0xb\0035\0028\0011", !1, !91}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!91 = !{!"0xb\0035\005\0010", !1, !88}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/fp-convert.c]
!92 = !MDLocation(line: 36, column: 14, scope: !90)
!93 = !MDLocation(line: 36, column: 7, scope: !90)
!94 = !MDLocation(line: 37, column: 14, scope: !90)
!95 = !MDLocation(line: 37, column: 7, scope: !90)
!96 = !MDLocation(line: 39, column: 14, scope: !75)
!97 = !MDLocation(line: 39, column: 5, scope: !75)
!98 = !MDLocation(line: 27, column: 22, scope: !76)
!99 = !MDLocation(line: 42, column: 3, scope: !19)
!100 = !MDLocation(line: 44, column: 3, scope: !19)
!101 = !MDLocation(line: 45, column: 1, scope: !19)
