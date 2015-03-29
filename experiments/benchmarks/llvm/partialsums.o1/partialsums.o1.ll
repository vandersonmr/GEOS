; ModuleID = 'partialsums.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"%.9f\09%s\0A\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"(2/3)^k\00", align 1
@.str2 = private unnamed_addr constant [7 x i8] c"k^-0.5\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"1/k(k+1)\00", align 1
@.str4 = private unnamed_addr constant [12 x i8] c"Flint Hills\00", align 1
@.str5 = private unnamed_addr constant [14 x i8] c"Cookson Hills\00", align 1
@.str6 = private unnamed_addr constant [9 x i8] c"Harmonic\00", align 1
@.str7 = private unnamed_addr constant [13 x i8] c"Riemann Zeta\00", align 1
@.str8 = private unnamed_addr constant [21 x i8] c"Alternating Harmonic\00", align 1
@.str9 = private unnamed_addr constant [8 x i8] c"Gregory\00", align 1

; Function Attrs: nounwind readnone uwtable
define <2 x double> @make_vec(double %a, double %b) #0 {
entry:
  tail call void @llvm.dbg.value(metadata double %a, i64 0, metadata !16, metadata !60), !dbg !61
  tail call void @llvm.dbg.value(metadata double %b, i64 0, metadata !17, metadata !60), !dbg !62
  tail call void @llvm.dbg.value(metadata double* undef, i64 0, metadata !19, metadata !60), !dbg !63
  %v.0.vec.insert = insertelement <2 x double> undef, double %a, i32 0, !dbg !64
  tail call void @llvm.dbg.value(metadata <2 x double> %v.0.vec.insert, i64 0, metadata !18, metadata !60), !dbg !65
  %v.8.vec.insert = insertelement <2 x double> %v.0.vec.insert, double %b, i32 1, !dbg !66
  tail call void @llvm.dbg.value(metadata <2 x double> %v.8.vec.insert, i64 0, metadata !18, metadata !60), !dbg !65
  ret <2 x double> %v.8.vec.insert, !dbg !67
}

; Function Attrs: nounwind readnone uwtable
define double @sum_vec(<2 x double> %x) #0 {
entry:
  tail call void @llvm.dbg.value(metadata <2 x double> %x, i64 0, metadata !24, metadata !60), !dbg !68
  tail call void @llvm.dbg.value(metadata double* undef, i64 0, metadata !25, metadata !60), !dbg !69
  %x.addr.0.vec.extract = extractelement <2 x double> %x, i32 0, !dbg !70
  %x.addr.8.vec.extract = extractelement <2 x double> %x, i32 1, !dbg !71
  %add = fadd double %x.addr.0.vec.extract, %x.addr.8.vec.extract, !dbg !70
  ret double %add, !dbg !72
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #1 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %argc, i64 0, metadata !34, metadata !60), !dbg !73
  tail call void @llvm.dbg.value(metadata i8** %argv, i64 0, metadata !35, metadata !60), !dbg !74
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !36, metadata !60), !dbg !75
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !37, metadata !60), !dbg !76
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !38, metadata !60), !dbg !77
  tail call void @llvm.dbg.value(metadata double 0.000000e+00, i64 0, metadata !39, metadata !60), !dbg !78
  tail call void @llvm.dbg.value(metadata i32 2500000, i64 0, metadata !56, metadata !60), !dbg !79
  tail call void @llvm.dbg.value(metadata <2 x double> %call, i64 0, metadata !45, metadata !60), !dbg !80
  %call1 = tail call <2 x double> @make_vec(double 1.000000e+00, double 1.000000e+00), !dbg !81
  tail call void @llvm.dbg.value(metadata <2 x double> %call1, i64 0, metadata !46, metadata !60), !dbg !82
  tail call void @llvm.dbg.value(metadata <2 x double> %call2, i64 0, metadata !47, metadata !60), !dbg !83
  %call4 = tail call <2 x double> @make_vec(double 1.000000e+00, double 2.000000e+00), !dbg !84
  tail call void @llvm.dbg.value(metadata <2 x double> %call4, i64 0, metadata !48, metadata !60), !dbg !85
  tail call void @llvm.dbg.value(metadata <2 x double> %call5, i64 0, metadata !51, metadata !60), !dbg !86
  tail call void @llvm.dbg.value(metadata <2 x double> %call, i64 0, metadata !44, metadata !60), !dbg !87
  tail call void @llvm.dbg.value(metadata <2 x double> %call, i64 0, metadata !43, metadata !60), !dbg !88
  tail call void @llvm.dbg.value(metadata <2 x double> %call, i64 0, metadata !42, metadata !60), !dbg !89
  tail call void @llvm.dbg.value(metadata <2 x double> %call, i64 0, metadata !41, metadata !60), !dbg !90
  tail call void @llvm.dbg.value(metadata <2 x double> %call, i64 0, metadata !40, metadata !60), !dbg !91
  tail call void @llvm.dbg.value(metadata double 1.000000e+00, i64 0, metadata !52, metadata !60), !dbg !92
  br label %for.body, !dbg !93

for.cond21.preheader:                             ; preds = %for.body
  %call = tail call <2 x double> @make_vec(double 0.000000e+00, double 0.000000e+00), !dbg !95
  %call2 = tail call <2 x double> @make_vec(double 2.000000e+00, double 2.000000e+00), !dbg !96
  %call5 = tail call <2 x double> @make_vec(double 1.000000e+00, double -1.000000e+00), !dbg !97
  %kv.0.vec.extract93 = extractelement <2 x double> %call4, i32 0, !dbg !98
  %cmp2394 = fcmp ugt double %kv.0.vec.extract93, 2.500000e+06, !dbg !98
  br i1 %cmp2394, label %for.end43, label %for.body25, !dbg !101

for.body:                                         ; preds = %entry, %for.body
  %twoThrd.0109 = phi double [ 0.000000e+00, %entry ], [ %add, %for.body ]
  %sqrts.0108 = phi double [ 0.000000e+00, %entry ], [ %add9, %for.body ]
  %Flint.0107 = phi double [ 0.000000e+00, %entry ], [ %add16, %for.body ]
  %Cookson.0106 = phi double [ 0.000000e+00, %entry ], [ %add20, %for.body ]
  %k.0105.int = phi i32 [ 1, %entry ], [ %inc.int, %for.body ]
  %indvar.conv = sitofp i32 %k.0105.int to double
  %sub = fadd double %indvar.conv, -1.000000e+00, !dbg !102
  %call7 = tail call double @pow(double 0x3FE5555555555555, double %sub) #4, !dbg !105
  %add = fadd double %twoThrd.0109, %call7, !dbg !106
  tail call void @llvm.dbg.value(metadata double %add, i64 0, metadata !36, metadata !60), !dbg !75
  %call8 = tail call double @sqrt(double %indvar.conv) #4, !dbg !107
  %div = fdiv double 1.000000e+00, %call8, !dbg !108
  %add9 = fadd double %sqrts.0108, %div, !dbg !109
  tail call void @llvm.dbg.value(metadata double %add9, i64 0, metadata !37, metadata !60), !dbg !76
  %mul = fmul double %indvar.conv, %indvar.conv, !dbg !110
  %mul10 = fmul double %indvar.conv, %mul, !dbg !110
  tail call void @llvm.dbg.value(metadata double %mul10, i64 0, metadata !53, metadata !60), !dbg !111
  %call11 = tail call double @sin(double %indvar.conv) #4, !dbg !112
  tail call void @llvm.dbg.value(metadata double %call11, i64 0, metadata !54, metadata !60), !dbg !113
  %call12 = tail call double @cos(double %indvar.conv) #4, !dbg !114
  tail call void @llvm.dbg.value(metadata double %call12, i64 0, metadata !55, metadata !60), !dbg !115
  %mul13 = fmul double %mul10, %call11, !dbg !116
  %mul14 = fmul double %call11, %mul13, !dbg !116
  %div15 = fdiv double 1.000000e+00, %mul14, !dbg !117
  %add16 = fadd double %Flint.0107, %div15, !dbg !118
  tail call void @llvm.dbg.value(metadata double %add16, i64 0, metadata !38, metadata !60), !dbg !77
  %mul17 = fmul double %mul10, %call12, !dbg !119
  %mul18 = fmul double %call12, %mul17, !dbg !119
  %div19 = fdiv double 1.000000e+00, %mul18, !dbg !120
  %add20 = fadd double %Cookson.0106, %div19, !dbg !121
  tail call void @llvm.dbg.value(metadata double %add20, i64 0, metadata !39, metadata !60), !dbg !78
  %inc.int = add nuw nsw i32 %k.0105.int, 1
  tail call void @llvm.dbg.value(metadata double undef, i64 0, metadata !52, metadata !60), !dbg !92
  %exitcond = icmp eq i32 %inc.int, 2500001, !dbg !93
  br i1 %exitcond, label %for.cond21.preheader, label %for.body, !dbg !93

for.body25:                                       ; preds = %for.cond21.preheader, %for.body25
  %Harmonic.0100 = phi <2 x double> [ %add31, %for.body25 ], [ %call, %for.cond21.preheader ]
  %kv.099 = phi <2 x double> [ %add42, %for.body25 ], [ %call4, %for.cond21.preheader ]
  %zeta.098 = phi <2 x double> [ %add34, %for.body25 ], [ %call, %for.cond21.preheader ]
  %poly.097 = phi <2 x double> [ %add29, %for.body25 ], [ %call, %for.cond21.preheader ]
  %alt.096 = phi <2 x double> [ %add36, %for.body25 ], [ %call, %for.cond21.preheader ]
  %Gregory.095 = phi <2 x double> [ %add40, %for.body25 ], [ %call, %for.cond21.preheader ]
  %add26 = fadd <2 x double> %call1, %kv.099, !dbg !122
  %mul27 = fmul <2 x double> %kv.099, %add26, !dbg !124
  %div28 = fdiv <2 x double> %call1, %mul27, !dbg !125
  %add29 = fadd <2 x double> %poly.097, %div28, !dbg !126
  tail call void @llvm.dbg.value(metadata <2 x double> %add29, i64 0, metadata !42, metadata !60), !dbg !89
  %div30 = fdiv <2 x double> %call1, %kv.099, !dbg !127
  %add31 = fadd <2 x double> %Harmonic.0100, %div30, !dbg !128
  tail call void @llvm.dbg.value(metadata <2 x double> %add31, i64 0, metadata !40, metadata !60), !dbg !91
  %mul32 = fmul <2 x double> %kv.099, %kv.099, !dbg !129
  %div33 = fdiv <2 x double> %call1, %mul32, !dbg !130
  %add34 = fadd <2 x double> %zeta.098, %div33, !dbg !131
  tail call void @llvm.dbg.value(metadata <2 x double> %add34, i64 0, metadata !41, metadata !60), !dbg !90
  %div35 = fdiv <2 x double> %call5, %kv.099, !dbg !132
  %add36 = fadd <2 x double> %alt.096, %div35, !dbg !133
  tail call void @llvm.dbg.value(metadata <2 x double> %add36, i64 0, metadata !43, metadata !60), !dbg !88
  %mul37 = fmul <2 x double> %call2, %kv.099, !dbg !134
  %sub38 = fsub <2 x double> %mul37, %call1, !dbg !134
  %div39 = fdiv <2 x double> %call5, %sub38, !dbg !135
  %add40 = fadd <2 x double> %Gregory.095, %div39, !dbg !136
  tail call void @llvm.dbg.value(metadata <2 x double> %add40, i64 0, metadata !44, metadata !60), !dbg !87
  %add42 = fadd <2 x double> %call2, %kv.099, !dbg !137
  tail call void @llvm.dbg.value(metadata <2 x double> %add42, i64 0, metadata !50, metadata !60), !dbg !138
  %kv.0.vec.extract = extractelement <2 x double> %add42, i32 0, !dbg !98
  %cmp23 = fcmp ugt double %kv.0.vec.extract, 2.500000e+06, !dbg !98
  br i1 %cmp23, label %for.end43, label %for.body25, !dbg !101

for.end43:                                        ; preds = %for.body25, %for.cond21.preheader
  %Harmonic.0.lcssa = phi <2 x double> [ %call, %for.cond21.preheader ], [ %add31, %for.body25 ]
  %zeta.0.lcssa = phi <2 x double> [ %call, %for.cond21.preheader ], [ %add34, %for.body25 ]
  %poly.0.lcssa = phi <2 x double> [ %call, %for.cond21.preheader ], [ %add29, %for.body25 ]
  %alt.0.lcssa = phi <2 x double> [ %call, %for.cond21.preheader ], [ %add36, %for.body25 ]
  %Gregory.0.lcssa = phi <2 x double> [ %call, %for.cond21.preheader ], [ %add40, %for.body25 ]
  %call44 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %add, i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0)) #4, !dbg !139
  %call45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %add9, i8* getelementptr inbounds ([7 x i8]* @.str2, i64 0, i64 0)) #4, !dbg !140
  %call46 = tail call double @sum_vec(<2 x double> %poly.0.lcssa), !dbg !141
  %call47 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %call46, i8* getelementptr inbounds ([9 x i8]* @.str3, i64 0, i64 0)) #4, !dbg !141
  %call48 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %add16, i8* getelementptr inbounds ([12 x i8]* @.str4, i64 0, i64 0)) #4, !dbg !142
  %call49 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %add20, i8* getelementptr inbounds ([14 x i8]* @.str5, i64 0, i64 0)) #4, !dbg !143
  %call50 = tail call double @sum_vec(<2 x double> %Harmonic.0.lcssa), !dbg !144
  %call51 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %call50, i8* getelementptr inbounds ([9 x i8]* @.str6, i64 0, i64 0)) #4, !dbg !144
  %call52 = tail call double @sum_vec(<2 x double> %zeta.0.lcssa), !dbg !145
  %call53 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %call52, i8* getelementptr inbounds ([13 x i8]* @.str7, i64 0, i64 0)) #4, !dbg !145
  %call54 = tail call double @sum_vec(<2 x double> %alt.0.lcssa), !dbg !146
  %call55 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %call54, i8* getelementptr inbounds ([21 x i8]* @.str8, i64 0, i64 0)) #4, !dbg !146
  %call56 = tail call double @sum_vec(<2 x double> %Gregory.0.lcssa), !dbg !147
  %call57 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), double %call56, i8* getelementptr inbounds ([8 x i8]* @.str9, i64 0, i64 0)) #4, !dbg !147
  ret i32 0, !dbg !148
}

; Function Attrs: nounwind
declare double @pow(double, double) #2

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind
declare double @sin(double) #2

; Function Attrs: nounwind
declare double @cos(double) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #3

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!57, !58}
!llvm.ident = !{!59}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !3, !6, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/partialsums.c] [DW_LANG_C99]
!1 = !{!"partialsums.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0xf\00\000\0064\0064\000\000", null, null, !5} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from double]
!5 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!6 = !{!7, !20, !26}
!7 = !{!"0x2e\00make_vec\00make_vec\00\0012\000\001\000\000\00256\001\0013", !1, !8, !9, null, <2 x double> (double, double)* @make_vec, null, null, !15} ; [ DW_TAG_subprogram ] [line 12] [def] [scope 13] [make_vec]
!8 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/partialsums.c]
!9 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !10, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = !{!11, !5, !5}
!11 = !{!"0x16\00v2df\0010\000\000\000\000", !1, null, !12} ; [ DW_TAG_typedef ] [v2df] [line 10, size 0, align 0, offset 0] [from ]
!12 = !{!"0x1\00\000\00128\00128\000\002048\000", null, null, !5, !13, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 128, offset 0] [vector] [from double]
!13 = !{!14}
!14 = !{!"0x21\000\002"}                          ; [ DW_TAG_subrange_type ] [0, 1]
!15 = !{!16, !17, !18, !19}
!16 = !{!"0x101\00a\0016777228\000", !7, !8, !5}  ; [ DW_TAG_arg_variable ] [a] [line 12]
!17 = !{!"0x101\00b\0033554444\000", !7, !8, !5}  ; [ DW_TAG_arg_variable ] [b] [line 12]
!18 = !{!"0x100\00v\0014\000", !7, !8, !11}       ; [ DW_TAG_auto_variable ] [v] [line 14]
!19 = !{!"0x100\00tmp\0015\000", !7, !8, !4}      ; [ DW_TAG_auto_variable ] [tmp] [line 15]
!20 = !{!"0x2e\00sum_vec\00sum_vec\00\0020\000\001\000\000\00256\001\0021", !1, !8, !21, null, double (<2 x double>)* @sum_vec, null, null, !23} ; [ DW_TAG_subprogram ] [line 20] [def] [scope 21] [sum_vec]
!21 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !22, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!22 = !{!5, !11}
!23 = !{!24, !25}
!24 = !{!"0x101\00x\0016777236\000", !20, !8, !11} ; [ DW_TAG_arg_variable ] [x] [line 20]
!25 = !{!"0x100\00tmp\0022\000", !20, !8, !4}     ; [ DW_TAG_auto_variable ] [tmp] [line 22]
!26 = !{!"0x2e\00main\00main\00\0026\000\001\000\000\00256\001\0027", !1, !8, !27, null, i32 (i32, i8**)* @main, null, null, !33} ; [ DW_TAG_subprogram ] [line 26] [def] [scope 27] [main]
!27 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !28, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!28 = !{!29, !29, !30}
!29 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!30 = !{!"0xf\00\000\0064\0064\000\000", null, null, !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!31 = !{!"0xf\00\000\0064\0064\000\000", null, null, !32} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!32 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!33 = !{!34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56}
!34 = !{!"0x101\00argc\0016777242\000", !26, !8, !29} ; [ DW_TAG_arg_variable ] [argc] [line 26]
!35 = !{!"0x101\00argv\0033554458\000", !26, !8, !30} ; [ DW_TAG_arg_variable ] [argv] [line 26]
!36 = !{!"0x100\00twoThrd\0028\000", !26, !8, !5} ; [ DW_TAG_auto_variable ] [twoThrd] [line 28]
!37 = !{!"0x100\00sqrts\0028\000", !26, !8, !5}   ; [ DW_TAG_auto_variable ] [sqrts] [line 28]
!38 = !{!"0x100\00Flint\0028\000", !26, !8, !5}   ; [ DW_TAG_auto_variable ] [Flint] [line 28]
!39 = !{!"0x100\00Cookson\0028\000", !26, !8, !5} ; [ DW_TAG_auto_variable ] [Cookson] [line 28]
!40 = !{!"0x100\00Harmonic\0029\000", !26, !8, !11} ; [ DW_TAG_auto_variable ] [Harmonic] [line 29]
!41 = !{!"0x100\00zeta\0029\000", !26, !8, !11}   ; [ DW_TAG_auto_variable ] [zeta] [line 29]
!42 = !{!"0x100\00poly\0029\000", !26, !8, !11}   ; [ DW_TAG_auto_variable ] [poly] [line 29]
!43 = !{!"0x100\00alt\0029\000", !26, !8, !11}    ; [ DW_TAG_auto_variable ] [alt] [line 29]
!44 = !{!"0x100\00Gregory\0029\000", !26, !8, !11} ; [ DW_TAG_auto_variable ] [Gregory] [line 29]
!45 = !{!"0x100\00zero\0030\000", !26, !8, !11}   ; [ DW_TAG_auto_variable ] [zero] [line 30]
!46 = !{!"0x100\00one\0030\000", !26, !8, !11}    ; [ DW_TAG_auto_variable ] [one] [line 30]
!47 = !{!"0x100\00two\0030\000", !26, !8, !11}    ; [ DW_TAG_auto_variable ] [two] [line 30]
!48 = !{!"0x100\00init\0030\000", !26, !8, !11}   ; [ DW_TAG_auto_variable ] [init] [line 30]
!49 = !{!"0x100\00m_one\0030\000", !26, !8, !11}  ; [ DW_TAG_auto_variable ] [m_one] [line 30]
!50 = !{!"0x100\00kv\0030\000", !26, !8, !11}     ; [ DW_TAG_auto_variable ] [kv] [line 30]
!51 = !{!"0x100\00av\0030\000", !26, !8, !11}     ; [ DW_TAG_auto_variable ] [av] [line 30]
!52 = !{!"0x100\00k\0032\000", !26, !8, !5}       ; [ DW_TAG_auto_variable ] [k] [line 32]
!53 = !{!"0x100\00k3\0032\000", !26, !8, !5}      ; [ DW_TAG_auto_variable ] [k3] [line 32]
!54 = !{!"0x100\00s\0032\000", !26, !8, !5}       ; [ DW_TAG_auto_variable ] [s] [line 32]
!55 = !{!"0x100\00c\0032\000", !26, !8, !5}       ; [ DW_TAG_auto_variable ] [c] [line 32]
!56 = !{!"0x100\00n\0033\000", !26, !8, !29}      ; [ DW_TAG_auto_variable ] [n] [line 33]
!57 = !{i32 2, !"Dwarf Version", i32 4}
!58 = !{i32 2, !"Debug Info Version", i32 2}
!59 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!60 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!61 = !MDLocation(line: 12, column: 22, scope: !7)
!62 = !MDLocation(line: 12, column: 32, scope: !7)
!63 = !MDLocation(line: 15, column: 13, scope: !7)
!64 = !MDLocation(line: 16, column: 25, scope: !7)
!65 = !MDLocation(line: 14, column: 10, scope: !7)
!66 = !MDLocation(line: 16, column: 37, scope: !7)
!67 = !MDLocation(line: 17, column: 5, scope: !7)
!68 = !MDLocation(line: 20, column: 21, scope: !20)
!69 = !MDLocation(line: 22, column: 13, scope: !20)
!70 = !MDLocation(line: 23, column: 12, scope: !20)
!71 = !MDLocation(line: 23, column: 21, scope: !20)
!72 = !MDLocation(line: 23, column: 5, scope: !20)
!73 = !MDLocation(line: 26, column: 14, scope: !26)
!74 = !MDLocation(line: 26, column: 26, scope: !26)
!75 = !MDLocation(line: 28, column: 13, scope: !26)
!76 = !MDLocation(line: 28, column: 26, scope: !26)
!77 = !MDLocation(line: 28, column: 37, scope: !26)
!78 = !MDLocation(line: 28, column: 48, scope: !26)
!79 = !MDLocation(line: 33, column: 9, scope: !26)
!80 = !MDLocation(line: 30, column: 13, scope: !26)
!81 = !MDLocation(line: 35, column: 44, scope: !26)
!82 = !MDLocation(line: 30, column: 19, scope: !26)
!83 = !MDLocation(line: 30, column: 24, scope: !26)
!84 = !MDLocation(line: 37, column: 13, scope: !26)
!85 = !MDLocation(line: 30, column: 29, scope: !26)
!86 = !MDLocation(line: 30, column: 46, scope: !26)
!87 = !MDLocation(line: 29, column: 40, scope: !26)
!88 = !MDLocation(line: 29, column: 35, scope: !26)
!89 = !MDLocation(line: 29, column: 29, scope: !26)
!90 = !MDLocation(line: 29, column: 23, scope: !26)
!91 = !MDLocation(line: 29, column: 13, scope: !26)
!92 = !MDLocation(line: 32, column: 13, scope: !26)
!93 = !MDLocation(line: 41, column: 5, scope: !94)
!94 = !{!"0xb\0041\005\000", !1, !26}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/partialsums.c]
!95 = !MDLocation(line: 35, column: 13, scope: !26)
!96 = !MDLocation(line: 36, column: 13, scope: !26)
!97 = !MDLocation(line: 37, column: 44, scope: !26)
!98 = !MDLocation(line: 51, column: 19, scope: !99)
!99 = !{!"0xb\0051\005\004", !1, !100}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/partialsums.c]
!100 = !{!"0xb\0051\005\003", !1, !26}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/partialsums.c]
!101 = !MDLocation(line: 51, column: 5, scope: !100)
!102 = !MDLocation(line: 43, column: 33, scope: !103)
!103 = !{!"0xb\0042\005\002", !1, !104}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/partialsums.c]
!104 = !{!"0xb\0041\005\001", !1, !94}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/partialsums.c]
!105 = !MDLocation(line: 43, column: 20, scope: !103)
!106 = !MDLocation(line: 43, column: 9, scope: !103)
!107 = !MDLocation(line: 44, column: 24, scope: !103)
!108 = !MDLocation(line: 44, column: 20, scope: !103)
!109 = !MDLocation(line: 44, column: 9, scope: !103)
!110 = !MDLocation(line: 45, column: 20, scope: !103)
!111 = !MDLocation(line: 32, column: 16, scope: !26)
!112 = !MDLocation(line: 46, column: 20, scope: !103)
!113 = !MDLocation(line: 32, column: 20, scope: !26)
!114 = !MDLocation(line: 46, column: 32, scope: !103)
!115 = !MDLocation(line: 32, column: 23, scope: !26)
!116 = !MDLocation(line: 47, column: 25, scope: !103)
!117 = !MDLocation(line: 47, column: 20, scope: !103)
!118 = !MDLocation(line: 47, column: 9, scope: !103)
!119 = !MDLocation(line: 48, column: 25, scope: !103)
!120 = !MDLocation(line: 48, column: 20, scope: !103)
!121 = !MDLocation(line: 48, column: 9, scope: !103)
!122 = !MDLocation(line: 53, column: 30, scope: !123)
!123 = !{!"0xb\0052\005\005", !1, !99}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/base/partialsums.c]
!124 = !MDLocation(line: 53, column: 26, scope: !123)
!125 = !MDLocation(line: 53, column: 20, scope: !123)
!126 = !MDLocation(line: 53, column: 9, scope: !123)
!127 = !MDLocation(line: 54, column: 20, scope: !123)
!128 = !MDLocation(line: 54, column: 9, scope: !123)
!129 = !MDLocation(line: 55, column: 26, scope: !123)
!130 = !MDLocation(line: 55, column: 20, scope: !123)
!131 = !MDLocation(line: 55, column: 9, scope: !123)
!132 = !MDLocation(line: 56, column: 21, scope: !123)
!133 = !MDLocation(line: 56, column: 9, scope: !123)
!134 = !MDLocation(line: 57, column: 26, scope: !123)
!135 = !MDLocation(line: 57, column: 21, scope: !123)
!136 = !MDLocation(line: 57, column: 9, scope: !123)
!137 = !MDLocation(line: 51, column: 40, scope: !99)
!138 = !MDLocation(line: 30, column: 42, scope: !26)
!139 = !MDLocation(line: 61, column: 5, scope: !26)
!140 = !MDLocation(line: 61, column: 41, scope: !26)
!141 = !MDLocation(line: 62, column: 5, scope: !26)
!142 = !MDLocation(line: 62, column: 41, scope: !26)
!143 = !MDLocation(line: 63, column: 5, scope: !26)
!144 = !MDLocation(line: 63, column: 41, scope: !26)
!145 = !MDLocation(line: 64, column: 5, scope: !26)
!146 = !MDLocation(line: 64, column: 41, scope: !26)
!147 = !MDLocation(line: 65, column: 5, scope: !26)
!148 = !MDLocation(line: 67, column: 5, scope: !26)
