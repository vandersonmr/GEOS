; ModuleID = 'Stopwatch.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Stopwatch_struct = type { i32, double, double }

@seconds.t = internal unnamed_addr global double 0.000000e+00, align 8

; Function Attrs: nounwind uwtable
define double @seconds() #0 {
entry:
  %0 = load double* @seconds.t, align 8, !dbg !55, !tbaa !56
  %inc = fadd double %0, 1.000000e+00, !dbg !55
  store double %inc, double* @seconds.t, align 8, !dbg !55, !tbaa !56
  ret double %inc, !dbg !60
}

; Function Attrs: nounwind uwtable
define void @Stopwtach_reset(%struct.Stopwatch_struct* nocapture %Q) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Stopwatch_struct* %Q, i64 0, metadata !24, metadata !61), !dbg !62
  %running = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 0, !dbg !63
  store i32 0, i32* %running, align 4, !dbg !63, !tbaa !64
  %last_time = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 1, !dbg !67
  %0 = bitcast double* %last_time to i8*, !dbg !68
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 16, i32 8, i1 false), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nounwind uwtable
define noalias %struct.Stopwatch_struct* @new_Stopwatch() #0 {
entry:
  %call = tail call noalias i8* @malloc(i64 24) #3, !dbg !69
  tail call void @llvm.dbg.value(metadata %struct.Stopwatch_struct* %0, i64 0, metadata !29, metadata !61), !dbg !70
  %cmp = icmp eq i8* %call, null, !dbg !71
  br i1 %cmp, label %return, label %if.end, !dbg !73

if.end:                                           ; preds = %entry
  %0 = bitcast i8* %call to %struct.Stopwatch_struct*, !dbg !74
  tail call void @llvm.dbg.value(metadata %struct.Stopwatch_struct* %0, i64 0, metadata !75, metadata !61) #3, !dbg !77
  %running.i = bitcast i8* %call to i32*, !dbg !78
  store i32 0, i32* %running.i, align 4, !dbg !78, !tbaa !64
  %last_time.i = getelementptr inbounds i8* %call, i64 8, !dbg !79
  tail call void @llvm.memset.p0i8.i64(i8* %last_time.i, i8 0, i64 16, i32 8, i1 false) #3, !dbg !79
  br label %return, !dbg !80

return:                                           ; preds = %entry, %if.end
  %retval.0 = phi %struct.Stopwatch_struct* [ %0, %if.end ], [ null, %entry ]
  ret %struct.Stopwatch_struct* %retval.0, !dbg !81
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define void @Stopwatch_delete(%struct.Stopwatch_struct* %S) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Stopwatch_struct* %S, i64 0, metadata !32, metadata !61), !dbg !82
  %cmp = icmp eq %struct.Stopwatch_struct* %S, null, !dbg !83
  br i1 %cmp, label %if.end, label %if.then, !dbg !85

if.then:                                          ; preds = %entry
  %0 = bitcast %struct.Stopwatch_struct* %S to i8*, !dbg !86
  tail call void @free(i8* %0) #3, !dbg !87
  br label %if.end, !dbg !87

if.end:                                           ; preds = %entry, %if.then
  ret void, !dbg !88
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @Stopwatch_start(%struct.Stopwatch_struct* nocapture %Q) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Stopwatch_struct* %Q, i64 0, metadata !35, metadata !61), !dbg !89
  %running = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 0, !dbg !90
  %0 = load i32* %running, align 4, !dbg !90, !tbaa !64
  %tobool = icmp eq i32 %0, 0, !dbg !92
  br i1 %tobool, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  store i32 1, i32* %running, align 4, !dbg !93, !tbaa !64
  %total = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 2, !dbg !95
  store double 0.000000e+00, double* %total, align 8, !dbg !95, !tbaa !96
  %1 = load double* @seconds.t, align 8, !dbg !97, !tbaa !56
  %inc.i = fadd double %1, 1.000000e+00, !dbg !97
  store double %inc.i, double* @seconds.t, align 8, !dbg !97, !tbaa !56
  %last_time = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 1, !dbg !99
  store double %inc.i, double* %last_time, align 8, !dbg !99, !tbaa !100
  br label %if.end, !dbg !101

if.end:                                           ; preds = %entry, %if.then
  ret void, !dbg !102
}

; Function Attrs: nounwind uwtable
define void @Stopwatch_resume(%struct.Stopwatch_struct* nocapture %Q) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Stopwatch_struct* %Q, i64 0, metadata !38, metadata !61), !dbg !103
  %running = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 0, !dbg !104
  %0 = load i32* %running, align 4, !dbg !104, !tbaa !64
  %tobool = icmp eq i32 %0, 0, !dbg !106
  br i1 %tobool, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  %1 = load double* @seconds.t, align 8, !dbg !107, !tbaa !56
  %inc.i = fadd double %1, 1.000000e+00, !dbg !107
  store double %inc.i, double* @seconds.t, align 8, !dbg !107, !tbaa !56
  %last_time = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 1, !dbg !110
  store double %inc.i, double* %last_time, align 8, !dbg !110, !tbaa !100
  store i32 1, i32* %running, align 4, !dbg !111, !tbaa !64
  br label %if.end, !dbg !112

if.end:                                           ; preds = %entry, %if.then
  ret void, !dbg !113
}

; Function Attrs: nounwind uwtable
define void @Stopwatch_stop(%struct.Stopwatch_struct* nocapture %Q) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Stopwatch_struct* %Q, i64 0, metadata !41, metadata !61), !dbg !114
  %running = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 0, !dbg !115
  %0 = load i32* %running, align 4, !dbg !115, !tbaa !64
  %tobool = icmp eq i32 %0, 0, !dbg !117
  br i1 %tobool, label %if.end, label %if.then, !dbg !117

if.then:                                          ; preds = %entry
  %1 = load double* @seconds.t, align 8, !dbg !118, !tbaa !56
  %inc.i = fadd double %1, 1.000000e+00, !dbg !118
  store double %inc.i, double* @seconds.t, align 8, !dbg !118, !tbaa !56
  %last_time = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 1, !dbg !121
  %2 = load double* %last_time, align 8, !dbg !121, !tbaa !100
  %sub = fsub double %inc.i, %2, !dbg !119
  %total = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 2, !dbg !122
  %3 = load double* %total, align 8, !dbg !122, !tbaa !96
  %add = fadd double %3, %sub, !dbg !122
  store double %add, double* %total, align 8, !dbg !122, !tbaa !96
  store i32 0, i32* %running, align 4, !dbg !123, !tbaa !64
  br label %if.end, !dbg !124

if.end:                                           ; preds = %entry, %if.then
  ret void, !dbg !125
}

; Function Attrs: nounwind uwtable
define double @Stopwatch_read(%struct.Stopwatch_struct* nocapture %Q) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.Stopwatch_struct* %Q, i64 0, metadata !46, metadata !61), !dbg !126
  %running = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 0, !dbg !127
  %0 = load i32* %running, align 4, !dbg !127, !tbaa !64
  %tobool = icmp eq i32 %0, 0, !dbg !128
  br i1 %tobool, label %entry.if.end_crit_edge, label %if.then, !dbg !128

entry.if.end_crit_edge:                           ; preds = %entry
  %total2.phi.trans.insert = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 2
  %.pre = load double* %total2.phi.trans.insert, align 8, !dbg !129, !tbaa !96
  br label %if.end, !dbg !128

if.then:                                          ; preds = %entry
  %1 = load double* @seconds.t, align 8, !dbg !130, !tbaa !56
  %inc.i = fadd double %1, 1.000000e+00, !dbg !130
  store double %inc.i, double* @seconds.t, align 8, !dbg !130, !tbaa !56
  tail call void @llvm.dbg.value(metadata double %inc.i, i64 0, metadata !47, metadata !61), !dbg !132
  %last_time = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 1, !dbg !133
  %2 = load double* %last_time, align 8, !dbg !133, !tbaa !100
  %sub = fsub double %inc.i, %2, !dbg !134
  %total = getelementptr inbounds %struct.Stopwatch_struct* %Q, i64 0, i32 2, !dbg !135
  %3 = load double* %total, align 8, !dbg !135, !tbaa !96
  %add = fadd double %3, %sub, !dbg !135
  store double %add, double* %total, align 8, !dbg !135, !tbaa !96
  store double %inc.i, double* %last_time, align 8, !dbg !136, !tbaa !100
  br label %if.end, !dbg !137

if.end:                                           ; preds = %entry.if.end_crit_edge, %if.then
  %4 = phi double [ %.pre, %entry.if.end_crit_edge ], [ %add, %if.then ]
  ret double %4, !dbg !138
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!52, !53}
!llvm.ident = !{!54}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !15, !50, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Stopwatch.c] [DW_LANG_C99]
!1 = !{!"Stopwatch.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C"}
!2 = !{}
!3 = !{!4, !14}
!4 = !{!"0x16\00Stopwatch\009\000\000\000\000", !5, null, !6} ; [ DW_TAG_typedef ] [Stopwatch] [line 9, size 0, align 0, offset 0] [from ]
!5 = !{!"./Stopwatch.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C"}
!6 = !{!"0xf\00\000\0064\0064\000\000", null, null, !7} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!7 = !{!"0x13\00\004\00192\0064\000\000\000", !5, null, null, !8, null, null, null} ; [ DW_TAG_structure_type ] [line 4, size 192, align 64, offset 0] [def] [from ]
!8 = !{!9, !11, !13}
!9 = !{!"0xd\00running\005\0032\0032\000\000", !5, !7, !10} ; [ DW_TAG_member ] [running] [line 5, size 32, align 32, offset 0] [from int]
!10 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!11 = !{!"0xd\00last_time\006\0064\0064\0064\000", !5, !7, !12} ; [ DW_TAG_member ] [last_time] [line 6, size 64, align 64, offset 64] [from double]
!12 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!13 = !{!"0xd\00total\007\0064\0064\00128\000", !5, !7, !12} ; [ DW_TAG_member ] [total] [line 7, size 64, align 64, offset 128] [from double]
!14 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!15 = !{!16, !20, !25, !30, !33, !36, !39, !42}
!16 = !{!"0x2e\00seconds\00seconds\00\004\000\001\000\000\000\001\005", !1, !17, !18, null, double ()* @seconds, null, null, !2} ; [ DW_TAG_subprogram ] [line 4] [def] [scope 5] [seconds]
!17 = !{!"0x29", !1}                              ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Stopwatch.c]
!18 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !19, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!19 = !{!12}
!20 = !{!"0x2e\00Stopwtach_reset\00Stopwtach_reset\00\0011\000\001\000\000\00256\001\0012", !1, !17, !21, null, void (%struct.Stopwatch_struct*)* @Stopwtach_reset, null, null, !23} ; [ DW_TAG_subprogram ] [line 11] [def] [scope 12] [Stopwtach_reset]
!21 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !22, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = !{null, !4}
!23 = !{!24}
!24 = !{!"0x101\00Q\0016777227\000", !20, !17, !4} ; [ DW_TAG_arg_variable ] [Q] [line 11]
!25 = !{!"0x2e\00new_Stopwatch\00new_Stopwatch\00\0019\000\001\000\000\00256\001\0020", !1, !17, !26, null, %struct.Stopwatch_struct* ()* @new_Stopwatch, null, null, !28} ; [ DW_TAG_subprogram ] [line 19] [def] [scope 20] [new_Stopwatch]
!26 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !27, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = !{!4}
!28 = !{!29}
!29 = !{!"0x100\00S\0021\000", !25, !17, !4}      ; [ DW_TAG_auto_variable ] [S] [line 21]
!30 = !{!"0x2e\00Stopwatch_delete\00Stopwatch_delete\00\0029\000\001\000\000\00256\001\0030", !1, !17, !21, null, void (%struct.Stopwatch_struct*)* @Stopwatch_delete, null, null, !31} ; [ DW_TAG_subprogram ] [line 29] [def] [scope 30] [Stopwatch_delete]
!31 = !{!32}
!32 = !{!"0x101\00S\0016777245\000", !30, !17, !4} ; [ DW_TAG_arg_variable ] [S] [line 29]
!33 = !{!"0x2e\00Stopwatch_start\00Stopwatch_start\00\0038\000\001\000\000\00256\001\0039", !1, !17, !21, null, void (%struct.Stopwatch_struct*)* @Stopwatch_start, null, null, !34} ; [ DW_TAG_subprogram ] [line 38] [def] [scope 39] [Stopwatch_start]
!34 = !{!35}
!35 = !{!"0x101\00Q\0016777254\000", !33, !17, !4} ; [ DW_TAG_arg_variable ] [Q] [line 38]
!36 = !{!"0x2e\00Stopwatch_resume\00Stopwatch_resume\00\0054\000\001\000\000\00256\001\0055", !1, !17, !21, null, void (%struct.Stopwatch_struct*)* @Stopwatch_resume, null, null, !37} ; [ DW_TAG_subprogram ] [line 54] [def] [scope 55] [Stopwatch_resume]
!37 = !{!38}
!38 = !{!"0x101\00Q\0016777270\000", !36, !17, !4} ; [ DW_TAG_arg_variable ] [Q] [line 54]
!39 = !{!"0x2e\00Stopwatch_stop\00Stopwatch_stop\00\0063\000\001\000\000\00256\001\0064", !1, !17, !21, null, void (%struct.Stopwatch_struct*)* @Stopwatch_stop, null, null, !40} ; [ DW_TAG_subprogram ] [line 63] [def] [scope 64] [Stopwatch_stop]
!40 = !{!41}
!41 = !{!"0x101\00Q\0016777279\000", !39, !17, !4} ; [ DW_TAG_arg_variable ] [Q] [line 63]
!42 = !{!"0x2e\00Stopwatch_read\00Stopwatch_read\00\0073\000\001\000\000\00256\001\0074", !1, !17, !43, null, double (%struct.Stopwatch_struct*)* @Stopwatch_read, null, null, !45} ; [ DW_TAG_subprogram ] [line 73] [def] [scope 74] [Stopwatch_read]
!43 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !44, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!44 = !{!12, !4}
!45 = !{!46, !47}
!46 = !{!"0x101\00Q\0016777289\000", !42, !17, !4} ; [ DW_TAG_arg_variable ] [Q] [line 73]
!47 = !{!"0x100\00t\0078\000", !48, !17, !12}     ; [ DW_TAG_auto_variable ] [t] [line 78]
!48 = !{!"0xb\0077\005\009", !1, !49}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Stopwatch.c]
!49 = !{!"0xb\0076\009\008", !1, !42}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Stopwatch.c]
!50 = !{!51}
!51 = !{!"0x34\00t\00t\00\007\001\001", !16, !17, !12, double* @seconds.t, null} ; [ DW_TAG_variable ] [t] [line 7] [local] [def]
!52 = !{i32 2, !"Dwarf Version", i32 4}
!53 = !{i32 2, !"Debug Info Version", i32 2}
!54 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!55 = !MDLocation(line: 8, column: 12, scope: !16)
!56 = !{!57, !57, i64 0}
!57 = !{!"double", !58, i64 0}
!58 = !{!"omnipotent char", !59, i64 0}
!59 = !{!"Simple C/C++ TBAA"}
!60 = !MDLocation(line: 8, column: 5, scope: !16)
!61 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!62 = !MDLocation(line: 11, column: 32, scope: !20)
!63 = !MDLocation(line: 13, column: 5, scope: !20)
!64 = !{!65, !66, i64 0}
!65 = !{!"", !66, i64 0, !57, i64 8, !57, i64 16}
!66 = !{!"int", !58, i64 0}
!67 = !MDLocation(line: 14, column: 5, scope: !20)
!68 = !MDLocation(line: 16, column: 1, scope: !20)
!69 = !MDLocation(line: 21, column: 31, scope: !25)
!70 = !MDLocation(line: 21, column: 15, scope: !25)
!71 = !MDLocation(line: 22, column: 9, scope: !72)
!72 = !{!"0xb\0022\009\000", !1, !25}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Stopwatch.c]
!73 = !MDLocation(line: 22, column: 9, scope: !25)
!74 = !MDLocation(line: 21, column: 19, scope: !25)
!75 = !{!"0x101\00Q\0016777227\000", !20, !17, !4, !76} ; [ DW_TAG_arg_variable ] [Q] [line 11]
!76 = !MDLocation(line: 25, column: 5, scope: !25)
!77 = !MDLocation(line: 11, column: 32, scope: !20, inlinedAt: !76)
!78 = !MDLocation(line: 13, column: 5, scope: !20, inlinedAt: !76)
!79 = !MDLocation(line: 14, column: 5, scope: !20, inlinedAt: !76)
!80 = !MDLocation(line: 26, column: 5, scope: !25)
!81 = !MDLocation(line: 27, column: 1, scope: !25)
!82 = !MDLocation(line: 29, column: 33, scope: !30)
!83 = !MDLocation(line: 31, column: 9, scope: !84)
!84 = !{!"0xb\0031\009\001", !1, !30}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Stopwatch.c]
!85 = !MDLocation(line: 31, column: 9, scope: !30)
!86 = !MDLocation(line: 32, column: 14, scope: !84)
!87 = !MDLocation(line: 32, column: 9, scope: !84)
!88 = !MDLocation(line: 33, column: 1, scope: !30)
!89 = !MDLocation(line: 38, column: 32, scope: !33)
!90 = !MDLocation(line: 40, column: 12, scope: !91)
!91 = !{!"0xb\0040\009\002", !1, !33}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Stopwatch.c]
!92 = !MDLocation(line: 40, column: 9, scope: !33)
!93 = !MDLocation(line: 42, column: 9, scope: !94)
!94 = !{!"0xb\0041\005\003", !1, !91}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Stopwatch.c]
!95 = !MDLocation(line: 43, column: 9, scope: !94)
!96 = !{!65, !57, i64 16}
!97 = !MDLocation(line: 8, column: 12, scope: !16, inlinedAt: !98)
!98 = !MDLocation(line: 44, column: 24, scope: !94)
!99 = !MDLocation(line: 44, column: 9, scope: !94)
!100 = !{!65, !57, i64 8}
!101 = !MDLocation(line: 45, column: 5, scope: !94)
!102 = !MDLocation(line: 46, column: 1, scope: !33)
!103 = !MDLocation(line: 54, column: 33, scope: !36)
!104 = !MDLocation(line: 56, column: 11, scope: !105)
!105 = !{!"0xb\0056\009\004", !1, !36}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Stopwatch.c]
!106 = !MDLocation(line: 56, column: 9, scope: !36)
!107 = !MDLocation(line: 8, column: 12, scope: !16, inlinedAt: !108)
!108 = !MDLocation(line: 58, column: 25, scope: !109)
!109 = !{!"0xb\0057\005\005", !1, !105}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Stopwatch.c]
!110 = !MDLocation(line: 58, column: 9, scope: !109)
!111 = !MDLocation(line: 59, column: 9, scope: !109)
!112 = !MDLocation(line: 60, column: 5, scope: !109)
!113 = !MDLocation(line: 61, column: 1, scope: !36)
!114 = !MDLocation(line: 63, column: 31, scope: !39)
!115 = !MDLocation(line: 65, column: 9, scope: !116)
!116 = !{!"0xb\0065\009\006", !1, !39}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Stopwatch.c]
!117 = !MDLocation(line: 65, column: 9, scope: !39)
!118 = !MDLocation(line: 8, column: 12, scope: !16, inlinedAt: !119)
!119 = !MDLocation(line: 67, column: 21, scope: !120)
!120 = !{!"0xb\0066\005\007", !1, !116}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/SciMark2-C/Stopwatch.c]
!121 = !MDLocation(line: 67, column: 33, scope: !120)
!122 = !MDLocation(line: 67, column: 9, scope: !120)
!123 = !MDLocation(line: 68, column: 9, scope: !120)
!124 = !MDLocation(line: 69, column: 5, scope: !120)
!125 = !MDLocation(line: 70, column: 1, scope: !39)
!126 = !MDLocation(line: 73, column: 33, scope: !42)
!127 = !MDLocation(line: 76, column: 9, scope: !49)
!128 = !MDLocation(line: 76, column: 9, scope: !42)
!129 = !MDLocation(line: 82, column: 12, scope: !42)
!130 = !MDLocation(line: 8, column: 12, scope: !16, inlinedAt: !131)
!131 = !MDLocation(line: 78, column: 20, scope: !48)
!132 = !MDLocation(line: 78, column: 16, scope: !48)
!133 = !MDLocation(line: 79, column: 25, scope: !48)
!134 = !MDLocation(line: 79, column: 21, scope: !48)
!135 = !MDLocation(line: 79, column: 9, scope: !48)
!136 = !MDLocation(line: 80, column: 9, scope: !48)
!137 = !MDLocation(line: 81, column: 5, scope: !48)
!138 = !MDLocation(line: 82, column: 5, scope: !42)
