; ModuleID = 'dt.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [30 x i8] c" %i iterations of each test. \00", align 1
@.str1 = private unnamed_addr constant [30 x i8] c" inner loop / array size %i.\0A\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
entry:
  %dvec1 = alloca double*, align 8
  %dvec2 = alloca double*, align 8
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !21, metadata !42), !dbg !43
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !22, metadata !42), !dbg !44
  %0 = bitcast double** %dvec1 to i8**, !dbg !45
  %call = call i32 @posix_memalign(i8** %0, i64 16, i64 16384) #3, !dbg !46
  %1 = bitcast double** %dvec2 to i8**, !dbg !47
  %call1 = call i32 @posix_memalign(i8** %1, i64 16, i64 16384) #3, !dbg !48
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str, i64 0, i64 0), i32 131072) #3, !dbg !49
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str1, i64 0, i64 0), i32 2048) #3, !dbg !50
  call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !27, metadata !42), !dbg !51
  br label %for.body, !dbg !52

for.body:                                         ; preds = %for.body, %entry
  %i.018 = phi i64 [ 0, %entry ], [ %inc, %for.body ]
  %sub = sub nsw i64 2048, %i.018, !dbg !54
  %conv = sitofp i64 %sub to float, !dbg !57
  %call4 = call float @cosf(float %conv) #3, !dbg !58
  %conv5 = fpext float %call4 to double, !dbg !58
  %mul = fmul double %conv5, 0x3FF000001AD7F29B, !dbg !59
  call void @llvm.dbg.value(metadata double** %dvec1, i64 0, metadata !23, metadata !42), !dbg !60
  %2 = load double** %dvec1, align 8, !dbg !61, !tbaa !62
  %arrayidx = getelementptr inbounds double* %2, i64 %i.018, !dbg !61
  store double %mul, double* %arrayidx, align 8, !dbg !61, !tbaa !66
  %conv6 = sitofp i64 %i.018 to float, !dbg !68
  %call7 = call float @sinf(float %conv6) #3, !dbg !69
  %conv8 = fpext float %call7 to double, !dbg !69
  %mul9 = fmul double %conv8, 1.000000e-10, !dbg !70
  %add = fadd double %mul9, 1.000000e+00, !dbg !71
  call void @llvm.dbg.value(metadata double** %dvec2, i64 0, metadata !26, metadata !42), !dbg !72
  %3 = load double** %dvec2, align 8, !dbg !73, !tbaa !62
  %arrayidx10 = getelementptr inbounds double* %3, i64 %i.018, !dbg !73
  store double %add, double* %arrayidx10, align 8, !dbg !73, !tbaa !66
  %inc = add nuw nsw i64 %i.018, 1, !dbg !74
  call void @llvm.dbg.value(metadata i64 %inc, i64 0, metadata !27, metadata !42), !dbg !51
  %exitcond = icmp eq i64 %inc, 2048, !dbg !52
  br i1 %exitcond, label %for.end, label %for.body, !dbg !52

for.end:                                          ; preds = %for.body
  %.lcssa = phi double* [ %3, %for.body ]
  call void @llvm.dbg.value(metadata double** %dvec1, i64 0, metadata !23, metadata !42), !dbg !60
  %4 = load double** %dvec1, align 8, !dbg !75, !tbaa !62
  call void @llvm.dbg.value(metadata double** %dvec2, i64 0, metadata !26, metadata !42), !dbg !72
  tail call void @llvm.dbg.value(metadata double* %4, i64 0, metadata !76, metadata !42), !dbg !78
  tail call void @llvm.dbg.value(metadata double* %3, i64 0, metadata !79, metadata !42), !dbg !80
  tail call void @llvm.dbg.value(metadata i64 0, i64 0, metadata !81, metadata !42), !dbg !82
  br label %vector.ph, !dbg !83

vector.ph:                                        ; preds = %for.inc5.i, %for.end
  %j.013.i = phi i64 [ 0, %for.end ], [ %inc6.i, %for.inc5.i ], !dbg !77
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ], !dbg !77
  %5 = getelementptr inbounds double* %.lcssa, i64 %index, !dbg !85
  %6 = bitcast double* %5 to <2 x double>*, !dbg !85
  %wide.load = load <2 x double>* %6, align 8, !dbg !85, !tbaa !66, !alias.scope !89, !noalias !92
  %.sum23 = or i64 %index, 2, !dbg !85
  %7 = getelementptr double* %.lcssa, i64 %.sum23, !dbg !85
  %8 = bitcast double* %7 to <2 x double>*, !dbg !85
  %wide.load20 = load <2 x double>* %8, align 8, !dbg !85, !tbaa !66, !alias.scope !89, !noalias !92
  %9 = getelementptr inbounds double* %4, i64 %index, !dbg !94
  %10 = bitcast double* %9 to <2 x double>*, !dbg !94
  %wide.load21 = load <2 x double>* %10, align 8, !dbg !94, !tbaa !66, !alias.scope !92, !noalias !89
  %.sum24 = or i64 %index, 2, !dbg !94
  %11 = getelementptr double* %4, i64 %.sum24, !dbg !94
  %12 = bitcast double* %11 to <2 x double>*, !dbg !94
  %wide.load22 = load <2 x double>* %12, align 8, !dbg !94, !tbaa !66, !alias.scope !92, !noalias !89
  %13 = fdiv <2 x double> %wide.load21, %wide.load, !dbg !94
  %14 = fdiv <2 x double> %wide.load22, %wide.load20, !dbg !94
  %15 = bitcast double* %9 to <2 x double>*, !dbg !94
  store <2 x double> %13, <2 x double>* %15, align 8, !dbg !94, !tbaa !66, !alias.scope !92, !noalias !89
  %16 = bitcast double* %11 to <2 x double>*, !dbg !94
  store <2 x double> %14, <2 x double>* %16, align 8, !dbg !94, !tbaa !66, !alias.scope !92, !noalias !89
  %index.next = add i64 %index, 4, !dbg !77
  %17 = icmp eq i64 %index.next, 2048, !dbg !77
  br i1 %17, label %for.inc5.i, label %vector.body, !dbg !77, !llvm.loop !95

for.inc5.i:                                       ; preds = %vector.body
  %inc6.i = add nuw nsw i64 %j.013.i, 1, !dbg !98
  tail call void @llvm.dbg.value(metadata i64 %inc6.i, i64 0, metadata !81, metadata !42), !dbg !82
  %exitcond14.i = icmp eq i64 %inc6.i, 131072, !dbg !83
  br i1 %exitcond14.i, label %double_array_divs_variable.exit, label %vector.ph, !dbg !83

double_array_divs_variable.exit:                  ; preds = %for.inc5.i
  call void @llvm.dbg.value(metadata double** %dvec1, i64 0, metadata !23, metadata !42), !dbg !60
  %18 = load double* %4, align 8, !dbg !99, !tbaa !66
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), double %18) #3, !dbg !100
  ret i32 0, !dbg !101
}

; Function Attrs: nounwind
declare i32 @posix_memalign(i8**, i64, i64) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare float @cosf(float) #1

; Function Attrs: nounwind
declare float @sinf(float) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!39, !40}
!llvm.ident = !{!41}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !7, !11, !38, !38} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c] [DW_LANG_C99]
!1 = !{!"dt.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{!3}
!3 = !{!"0x4\00\005\0032\0032\000\000\000", !1, null, null, !4, null, null, null} ; [ DW_TAG_enumeration_type ] [line 5, size 32, align 32, offset 0] [def] [from ]
!4 = !{!5, !6}
!5 = !{!"0x28\00ITERATIONS\00131072"}             ; [ DW_TAG_enumerator ] [ITERATIONS :: 131072]
!6 = !{!"0x28\00size\002048"}                     ; [ DW_TAG_enumerator ] [size :: 2048]
!7 = !{!8, !10}
!8 = !{!"0xf\00\000\0064\0064\000\000", null, null, !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!10 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!11 = !{!12, !29}
!12 = !{!"0x2e\00main\00main\00\0030\000\001\000\000\00256\001\0030", !1, !13, !14, null, i32 (i32, i8**)* @main, null, null, !20} ; [ DW_TAG_subprogram ] [line 30] [def] [main]
!13 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!14 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !15, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!15 = !{!16, !16, !17}
!16 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!18 = !{!"0xf\00\000\0064\0064\000\000", null, null, !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!19 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!20 = !{!21, !22, !23, !26, !27}
!21 = !{!"0x101\00argc\0016777246\000", !12, !13, !16} ; [ DW_TAG_arg_variable ] [argc] [line 30]
!22 = !{!"0x101\00argv\0033554462\000", !12, !13, !17} ; [ DW_TAG_arg_variable ] [argv] [line 30]
!23 = !{!"0x100\00dvec1\0031\000", !12, !13, !24} ; [ DW_TAG_auto_variable ] [dvec1] [line 31]
!24 = !{!"0xf\00\000\0064\0064\000\000", null, null, !25} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!25 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!26 = !{!"0x100\00dvec2\0031\000", !12, !13, !24} ; [ DW_TAG_auto_variable ] [dvec2] [line 31]
!27 = !{!"0x100\00i\0032\000", !12, !13, !28}     ; [ DW_TAG_auto_variable ] [i] [line 32]
!28 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!29 = !{!"0x2e\00double_array_divs_variable\00double_array_divs_variable\00\0011\001\001\000\000\00256\001\0012", !1, !13, !30, null, null, null, null, !33} ; [ DW_TAG_subprogram ] [line 11] [local] [def] [scope 12] [double_array_divs_variable]
!30 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !31, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!31 = !{null, !32, !32}
!32 = !{!"0x37\00\000\000\000\000\000", null, null, !24} ; [ DW_TAG_restrict_type ] [line 0, size 0, align 0, offset 0] [from ]
!33 = !{!34, !35, !36, !37}
!34 = !{!"0x101\00dvec1\0016777227\000", !29, !13, !32} ; [ DW_TAG_arg_variable ] [dvec1] [line 11]
!35 = !{!"0x101\00dvec2\0033554444\000", !29, !13, !32} ; [ DW_TAG_arg_variable ] [dvec2] [line 12]
!36 = !{!"0x100\00i\0013\000", !29, !13, !28}     ; [ DW_TAG_auto_variable ] [i] [line 13]
!37 = !{!"0x100\00j\0013\000", !29, !13, !28}     ; [ DW_TAG_auto_variable ] [j] [line 13]
!38 = !{}
!39 = !{i32 2, !"Dwarf Version", i32 4}
!40 = !{i32 2, !"Debug Info Version", i32 2}
!41 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!42 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!43 = !MDLocation(line: 30, column: 14, scope: !12)
!44 = !MDLocation(line: 30, column: 26, scope: !12)
!45 = !MDLocation(line: 34, column: 18, scope: !12)
!46 = !MDLocation(line: 34, column: 3, scope: !12)
!47 = !MDLocation(line: 35, column: 18, scope: !12)
!48 = !MDLocation(line: 35, column: 3, scope: !12)
!49 = !MDLocation(line: 37, column: 3, scope: !12)
!50 = !MDLocation(line: 38, column: 3, scope: !12)
!51 = !MDLocation(line: 32, column: 8, scope: !12)
!52 = !MDLocation(line: 42, column: 3, scope: !53)
!53 = !{!"0xb\0042\003\000", !1, !12}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!54 = !MDLocation(line: 43, column: 47, scope: !55)
!55 = !{!"0xb\0042\0031\002", !1, !56}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!56 = !{!"0xb\0042\003\001", !1, !53}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!57 = !MDLocation(line: 43, column: 39, scope: !55)
!58 = !MDLocation(line: 43, column: 34, scope: !55)
!59 = !MDLocation(line: 43, column: 22, scope: !55)
!60 = !MDLocation(line: 31, column: 11, scope: !12)
!61 = !MDLocation(line: 43, column: 11, scope: !55)
!62 = !{!63, !63, i64 0}
!63 = !{!"any pointer", !64, i64 0}
!64 = !{!"omnipotent char", !65, i64 0}
!65 = !{!"Simple C/C++ TBAA"}
!66 = !{!67, !67, i64 0}
!67 = !{!"double", !64, i64 0}
!68 = !MDLocation(line: 44, column: 49, scope: !55)
!69 = !MDLocation(line: 44, column: 44, scope: !55)
!70 = !MDLocation(line: 44, column: 29, scope: !55)
!71 = !MDLocation(line: 44, column: 22, scope: !55)
!72 = !MDLocation(line: 31, column: 19, scope: !12)
!73 = !MDLocation(line: 44, column: 11, scope: !55)
!74 = !MDLocation(line: 42, column: 25, scope: !56)
!75 = !MDLocation(line: 47, column: 31, scope: !12)
!76 = !{!"0x101\00dvec1\0016777227\000", !29, !13, !32, !77} ; [ DW_TAG_arg_variable ] [dvec1] [line 11]
!77 = !MDLocation(line: 47, column: 3, scope: !12)
!78 = !MDLocation(line: 11, column: 48, scope: !29, inlinedAt: !77)
!79 = !{!"0x101\00dvec2\0033554444\000", !29, !13, !32, !77} ; [ DW_TAG_arg_variable ] [dvec2] [line 12]
!80 = !MDLocation(line: 12, column: 48, scope: !29, inlinedAt: !77)
!81 = !{!"0x100\00j\0013\000", !29, !13, !28, !77} ; [ DW_TAG_auto_variable ] [j] [line 13]
!82 = !MDLocation(line: 13, column: 11, scope: !29, inlinedAt: !77)
!83 = !MDLocation(line: 14, column: 3, scope: !84, inlinedAt: !77)
!84 = !{!"0xb\0014\003\003", !1, !29}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!85 = !MDLocation(line: 16, column: 19, scope: !86, inlinedAt: !77)
!86 = !{!"0xb\0015\005\006", !1, !87}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!87 = !{!"0xb\0015\005\005", !1, !88}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!88 = !{!"0xb\0014\003\004", !1, !84}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/dt.c]
!89 = !{!90}
!90 = distinct !{!90, !91, !"double_array_divs_variable: %dvec2"}
!91 = distinct !{!91, !"double_array_divs_variable"}
!92 = !{!93}
!93 = distinct !{!93, !91, !"double_array_divs_variable: %dvec1"}
!94 = !MDLocation(line: 16, column: 7, scope: !86, inlinedAt: !77)
!95 = distinct !{!95, !96, !97}
!96 = !{!"llvm.loop.vectorize.width", i32 1}
!97 = !{!"llvm.loop.interleave.count", i32 1}
!98 = !MDLocation(line: 14, column: 30, scope: !88, inlinedAt: !77)
!99 = !MDLocation(line: 48, column: 18, scope: !12)
!100 = !MDLocation(line: 48, column: 3, scope: !12)
!101 = !MDLocation(line: 49, column: 3, scope: !12)
