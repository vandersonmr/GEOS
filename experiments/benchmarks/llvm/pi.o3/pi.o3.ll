; ModuleID = 'pi.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str1 = private unnamed_addr constant [45 x i8] c" x = %9.6f    y = %12.2f  low = %8d j = %7d\0A\00", align 1
@.str2 = private unnamed_addr constant [37 x i8] c"Pi = %9.6f ztot = %12.2f itot = %8d\0A\00", align 1
@str = private unnamed_addr constant [15 x i8] c"Starting PI...\00"

; Function Attrs: nounwind uwtable
define void @myadd(float* nocapture %sum, float* nocapture readonly %addend) #0 {
entry:
  tail call void @llvm.dbg.value(metadata float* %sum, i64 0, metadata !14, metadata !42), !dbg !43
  tail call void @llvm.dbg.value(metadata float* %addend, i64 0, metadata !15, metadata !42), !dbg !44
  %0 = load float* %sum, align 4, !dbg !45, !tbaa !46
  %1 = load float* %addend, align 4, !dbg !50, !tbaa !46
  %add = fadd float %0, %1, !dbg !45
  store float %add, float* %sum, align 4, !dbg !51, !tbaa !46
  ret void, !dbg !52
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !23, metadata !42), !dbg !53
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !24, metadata !42), !dbg !54
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([15 x i8]* @str, i64 0, i64 0)), !dbg !55
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !25, metadata !42), !dbg !56
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !57, metadata !42), !dbg !62
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !25, metadata !42), !dbg !56
  tail call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !25, metadata !42), !dbg !56
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !34, metadata !42), !dbg !63
  tail call void @llvm.dbg.value(metadata i64 1907, i64 0, metadata !35, metadata !42), !dbg !64
  tail call void @llvm.dbg.value(metadata float 5.813000e+03, i64 0, metadata !26, metadata !42), !dbg !65
  tail call void @llvm.dbg.value(metadata float 1.307000e+03, i64 0, metadata !27, metadata !42), !dbg !66
  tail call void @llvm.dbg.value(metadata float 5.471000e+03, i64 0, metadata !28, metadata !42), !dbg !67
  tail call void @llvm.dbg.value(metadata i64 40000000, i64 0, metadata !36, metadata !42), !dbg !68
  tail call void @llvm.dbg.value(metadata i64 1, i64 0, metadata !37, metadata !42), !dbg !69
  br label %for.body, !dbg !70

for.body:                                         ; preds = %for.body, %entry
  %yran.057 = phi float [ 5.813000e+03, %entry ], [ %sub10, %for.body ]
  %j.056 = phi i64 [ 1, %entry ], [ %inc, %for.body ]
  %ixran.055 = phi i64 [ 1907, %entry ], [ %div, %for.body ]
  %low.054 = phi i64 [ 1, %entry ], [ %low.1, %for.body ]
  %0 = phi float [ 0.000000e+00, %entry ], [ %add.i, %for.body ]
  %mul = mul nsw i64 %ixran.055, 27611, !dbg !71
  tail call void @llvm.dbg.value(metadata i64 %mul, i64 0, metadata !38, metadata !42), !dbg !72
  %div = srem i64 %mul, 74383, !dbg !73
  tail call void @llvm.dbg.value(metadata i64 %div, i64 0, metadata !35, metadata !42), !dbg !64
  %conv = sitofp i64 %div to float, !dbg !74
  tail call void @llvm.dbg.value(metadata float undef, i64 0, metadata !29, metadata !42), !dbg !75
  %mul5 = fmul float %yran.057, 1.307000e+03, !dbg !76
  tail call void @llvm.dbg.value(metadata float %mul5, i64 0, metadata !33, metadata !42), !dbg !77
  %div6 = fdiv float %mul5, 5.471000e+03, !dbg !78
  %conv7 = fptosi float %div6 to i64, !dbg !79
  %conv8 = sitofp i64 %conv7 to float, !dbg !79
  %mul9 = fmul float %conv8, 5.471000e+03, !dbg !80
  %sub10 = fsub float %mul5, %mul9, !dbg !81
  tail call void @llvm.dbg.value(metadata float %sub10, i64 0, metadata !26, metadata !42), !dbg !65
  %1 = insertelement <2 x float> undef, float %conv, i32 0, !dbg !74
  %2 = insertelement <2 x float> %1, float %sub10, i32 1, !dbg !74
  %3 = fdiv <2 x float> %2, <float 7.438300e+04, float 5.471000e+03>, !dbg !74
  tail call void @llvm.dbg.value(metadata float undef, i64 0, metadata !30, metadata !42), !dbg !82
  %4 = fmul <2 x float> %3, %3, !dbg !83
  %5 = extractelement <2 x float> %4, i32 0, !dbg !83
  %6 = extractelement <2 x float> %4, i32 1, !dbg !83
  %add = fadd float %5, %6, !dbg !83
  tail call void @llvm.dbg.value(metadata float %add, i64 0, metadata !31, metadata !42), !dbg !84
  tail call void @llvm.dbg.value(metadata float %add, i64 0, metadata !85, metadata !42), !dbg !86
  tail call void @llvm.dbg.value(metadata float %add, i64 0, metadata !31, metadata !42), !dbg !84
  tail call void @llvm.dbg.value(metadata float %add, i64 0, metadata !31, metadata !42), !dbg !84
  %add.i = fadd float %0, %add, !dbg !87
  tail call void @llvm.dbg.value(metadata float %add.i, i64 0, metadata !57, metadata !42), !dbg !62
  tail call void @llvm.dbg.value(metadata float %add.i, i64 0, metadata !25, metadata !42), !dbg !56
  tail call void @llvm.dbg.value(metadata float %add.i, i64 0, metadata !25, metadata !42), !dbg !56
  %not.cmp15 = fcmp ole float %add, 1.000000e+00, !dbg !88
  %add17 = zext i1 %not.cmp15 to i64, !dbg !88
  %low.1 = add nsw i64 %add17, %low.054, !dbg !88
  %inc = add nuw nsw i64 %j.056, 1, !dbg !89
  tail call void @llvm.dbg.value(metadata i64 %inc, i64 0, metadata !37, metadata !42), !dbg !69
  %exitcond = icmp eq i64 %inc, 40000001, !dbg !70
  br i1 %exitcond, label %for.end, label %for.body, !dbg !70

for.end:                                          ; preds = %for.body
  %low.1.lcssa = phi i64 [ %low.1, %for.body ]
  %add.i.lcssa = phi float [ %add.i, %for.body ]
  %.lcssa = phi <2 x float> [ %3, %for.body ]
  %7 = extractelement <2 x float> %.lcssa, i32 0, !dbg !90
  %phitmp.le = fpext float %7 to double, !dbg !90
  %8 = extractelement <2 x float> %.lcssa, i32 1, !dbg !90
  %phitmp51.le = fpext float %8 to double, !dbg !90
  %conv20 = trunc i64 %low.1.lcssa to i32, !dbg !91
  %call22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str1, i64 0, i64 0), double %phitmp.le, double %phitmp51.le, i32 %conv20, i32 40000001) #3, !dbg !92
  %conv23 = sitofp i64 %low.1.lcssa to float, !dbg !93
  %conv24 = fpext float %conv23 to double, !dbg !93
  %mul25 = fmul double %conv24, 4.000000e+00, !dbg !94
  %div28 = fdiv double %mul25, 4.000000e+07, !dbg !94
  %conv29 = fptrunc double %div28 to float, !dbg !94
  tail call void @llvm.dbg.value(metadata float %conv29, i64 0, metadata !32, metadata !42), !dbg !95
  %conv30 = fpext float %conv29 to double, !dbg !96
  %conv31 = fpext float %add.i.lcssa to double, !dbg !97
  %mul32 = fmul double %conv31, 0.000000e+00, !dbg !97
  %call34 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str2, i64 0, i64 0), double %conv30, double %mul32, i32 40000000) #3, !dbg !98
  ret i32 0, !dbg !99
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!39, !40}
!llvm.ident = !{!41}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !7, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/pi.c] [DW_LANG_C99]
!1 = !{!"pi.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!5 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!6 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!7 = !{!8, !16}
!8 = !{!"0x2e\00myadd\00myadd\00\0012\000\001\000\000\00256\001\0012", !1, !9, !10, null, void (float*, float*)* @myadd, null, null, !13} ; [ DW_TAG_subprogram ] [line 12] [def] [myadd]
!9 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/pi.c]
!10 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !11, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = !{null, !12, !12}
!12 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!13 = !{!14, !15}
!14 = !{!"0x101\00sum\0016777228\000", !8, !9, !12} ; [ DW_TAG_arg_variable ] [sum] [line 12]
!15 = !{!"0x101\00addend\0033554444\000", !8, !9, !12} ; [ DW_TAG_arg_variable ] [addend] [line 12]
!16 = !{!"0x2e\00main\00main\00\0021\000\001\000\000\00256\001\0021", !1, !9, !17, null, i32 (i32, i8**)* @main, null, null, !22} ; [ DW_TAG_subprogram ] [line 21] [def] [main]
!17 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !18, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = !{!6, !6, !19}
!19 = !{!"0xf\00\000\0064\0064\000\000", null, null, !20} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!20 = !{!"0xf\00\000\0064\0064\000\000", null, null, !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!21 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!22 = !{!23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38}
!23 = !{!"0x101\00argc\0016777237\000", !16, !9, !6} ; [ DW_TAG_arg_variable ] [argc] [line 21]
!24 = !{!"0x101\00argv\0033554453\000", !16, !9, !19} ; [ DW_TAG_arg_variable ] [argv] [line 21]
!25 = !{!"0x100\00ztot\0022\000", !16, !9, !5}    ; [ DW_TAG_auto_variable ] [ztot] [line 22]
!26 = !{!"0x100\00yran\0022\000", !16, !9, !5}    ; [ DW_TAG_auto_variable ] [yran] [line 22]
!27 = !{!"0x100\00ymult\0022\000", !16, !9, !5}   ; [ DW_TAG_auto_variable ] [ymult] [line 22]
!28 = !{!"0x100\00ymod\0022\000", !16, !9, !5}    ; [ DW_TAG_auto_variable ] [ymod] [line 22]
!29 = !{!"0x100\00x\0022\000", !16, !9, !5}       ; [ DW_TAG_auto_variable ] [x] [line 22]
!30 = !{!"0x100\00y\0022\000", !16, !9, !5}       ; [ DW_TAG_auto_variable ] [y] [line 22]
!31 = !{!"0x100\00z\0022\000", !16, !9, !5}       ; [ DW_TAG_auto_variable ] [z] [line 22]
!32 = !{!"0x100\00pi\0022\000", !16, !9, !5}      ; [ DW_TAG_auto_variable ] [pi] [line 22]
!33 = !{!"0x100\00prod\0022\000", !16, !9, !5}    ; [ DW_TAG_auto_variable ] [prod] [line 22]
!34 = !{!"0x100\00low\0023\000", !16, !9, !4}     ; [ DW_TAG_auto_variable ] [low] [line 23]
!35 = !{!"0x100\00ixran\0023\000", !16, !9, !4}   ; [ DW_TAG_auto_variable ] [ixran] [line 23]
!36 = !{!"0x100\00itot\0023\000", !16, !9, !4}    ; [ DW_TAG_auto_variable ] [itot] [line 23]
!37 = !{!"0x100\00j\0023\000", !16, !9, !4}       ; [ DW_TAG_auto_variable ] [j] [line 23]
!38 = !{!"0x100\00iprod\0023\000", !16, !9, !4}   ; [ DW_TAG_auto_variable ] [iprod] [line 23]
!39 = !{i32 2, !"Dwarf Version", i32 4}
!40 = !{i32 2, !"Debug Info Version", i32 2}
!41 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!42 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!43 = !MDLocation(line: 12, column: 19, scope: !8)
!44 = !MDLocation(line: 12, column: 30, scope: !8)
!45 = !MDLocation(line: 17, column: 14, scope: !8)
!46 = !{!47, !47, i64 0}
!47 = !{!"float", !48, i64 0}
!48 = !{!"omnipotent char", !49, i64 0}
!49 = !{!"Simple C/C++ TBAA"}
!50 = !MDLocation(line: 17, column: 21, scope: !8)
!51 = !MDLocation(line: 17, column: 7, scope: !8)
!52 = !MDLocation(line: 18, column: 1, scope: !8)
!53 = !MDLocation(line: 21, column: 14, scope: !16)
!54 = !MDLocation(line: 21, column: 26, scope: !16)
!55 = !MDLocation(line: 25, column: 7, scope: !16)
!56 = !MDLocation(line: 22, column: 10, scope: !16)
!57 = !{!"0x101\00sum\0016777228\000", !8, !9, !12, !58} ; [ DW_TAG_arg_variable ] [sum] [line 12]
!58 = !MDLocation(line: 55, column: 9, scope: !59)
!59 = !{!"0xb\0038\0030\002", !1, !60}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/pi.c]
!60 = !{!"0xb\0038\007\001", !1, !61}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/pi.c]
!61 = !{!"0xb\0038\007\000", !1, !16}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/pi.c]
!62 = !MDLocation(line: 12, column: 19, scope: !8, inlinedAt: !58)
!63 = !MDLocation(line: 23, column: 13, scope: !16)
!64 = !MDLocation(line: 23, column: 18, scope: !16)
!65 = !MDLocation(line: 22, column: 16, scope: !16)
!66 = !MDLocation(line: 22, column: 22, scope: !16)
!67 = !MDLocation(line: 22, column: 29, scope: !16)
!68 = !MDLocation(line: 23, column: 25, scope: !16)
!69 = !MDLocation(line: 23, column: 31, scope: !16)
!70 = !MDLocation(line: 38, column: 7, scope: !61)
!71 = !MDLocation(line: 48, column: 17, scope: !59)
!72 = !MDLocation(line: 23, column: 34, scope: !16)
!73 = !MDLocation(line: 49, column: 25, scope: !59)
!74 = !MDLocation(line: 50, column: 13, scope: !59)
!75 = !MDLocation(line: 22, column: 35, scope: !16)
!76 = !MDLocation(line: 51, column: 16, scope: !59)
!77 = !MDLocation(line: 22, column: 48, scope: !16)
!78 = !MDLocation(line: 52, column: 40, scope: !59)
!79 = !MDLocation(line: 52, column: 29, scope: !59)
!80 = !MDLocation(line: 52, column: 24, scope: !59)
!81 = !MDLocation(line: 52, column: 17, scope: !59)
!82 = !MDLocation(line: 22, column: 38, scope: !16)
!83 = !MDLocation(line: 54, column: 13, scope: !59)
!84 = !MDLocation(line: 22, column: 41, scope: !16)
!85 = !{!"0x101\00addend\0033554444\000", !8, !9, !12, !58} ; [ DW_TAG_arg_variable ] [addend] [line 12]
!86 = !MDLocation(line: 12, column: 30, scope: !8, inlinedAt: !58)
!87 = !MDLocation(line: 17, column: 14, scope: !8, inlinedAt: !58)
!88 = !MDLocation(line: 56, column: 14, scope: !59)
!89 = !MDLocation(line: 38, column: 25, scope: !60)
!90 = !MDLocation(line: 38, column: 7, scope: !60)
!91 = !MDLocation(line: 60, column: 66, scope: !16)
!92 = !MDLocation(line: 60, column: 7, scope: !16)
!93 = !MDLocation(line: 61, column: 18, scope: !16)
!94 = !MDLocation(line: 61, column: 12, scope: !16)
!95 = !MDLocation(line: 22, column: 44, scope: !16)
!96 = !MDLocation(line: 62, column: 54, scope: !16)
!97 = !MDLocation(line: 62, column: 57, scope: !16)
!98 = !MDLocation(line: 62, column: 7, scope: !16)
!99 = !MDLocation(line: 63, column: 7, scope: !16)
