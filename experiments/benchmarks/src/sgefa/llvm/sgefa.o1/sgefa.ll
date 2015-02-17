; ModuleID = 'sgefa.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.FULL = type { i32, i32, [1000 x float*] }

; Function Attrs: nounwind uwtable
define i32 @sgefa(%struct.FULL* nocapture readonly %a, i32* nocapture %ipvt) #0 {
entry:
  tail call void @llvm.dbg.value(metadata %struct.FULL* %a, i64 0, metadata !23, metadata !40), !dbg !41
  tail call void @llvm.dbg.value(metadata i32* %ipvt, i64 0, metadata !24, metadata !40), !dbg !42
  %cd = getelementptr inbounds %struct.FULL* %a, i64 0, i32 0, !dbg !43
  %0 = load i32* %cd, align 4, !dbg !43, !tbaa !45
  %rd = getelementptr inbounds %struct.FULL* %a, i64 0, i32 1, !dbg !50
  %1 = load i32* %rd, align 4, !dbg !50, !tbaa !51
  %cmp = icmp eq i32 %0, %1, !dbg !43
  br i1 %cmp, label %if.end, label %return, !dbg !52

if.end:                                           ; preds = %entry
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !31, metadata !40), !dbg !53
  %sub = add nsw i32 %0, -1, !dbg !54
  tail call void @llvm.dbg.value(metadata i32 %sub, i64 0, metadata !29, metadata !40), !dbg !55
  %arrayidx = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 0, !dbg !56
  %2 = load float** %arrayidx, align 8, !dbg !56, !tbaa !57
  tail call void @llvm.dbg.value(metadata float* %2, i64 0, metadata !33, metadata !40), !dbg !59
  tail call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !30, metadata !40), !dbg !60
  %cmp2 = icmp slt i32 %0, 2, !dbg !61
  br i1 %cmp2, label %CLEAN_UP, label %for.body.lr.ph, !dbg !63

for.body.lr.ph:                                   ; preds = %if.end
  %3 = add i32 %0, -1, !dbg !64
  %4 = sext i32 %0 to i64, !dbg !64
  %5 = sext i32 %0 to i64, !dbg !64
  %6 = sext i32 %0 to i64, !dbg !64
  %7 = zext i32 %0 to i64, !dbg !64
  %8 = sext i32 %sub to i64, !dbg !64
  %9 = icmp sgt i32 %3, 1
  %.op = add i32 %0, -2, !dbg !64
  %10 = zext i32 %.op to i64
  %.op186 = add nuw nsw i64 %10, 1, !dbg !64
  %11 = select i1 %9, i64 %.op186, i64 1, !dbg !64
  br label %for.body, !dbg !64

for.body:                                         ; preds = %for.body.lr.ph, %for.inc86
  %indvars.iv182 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next183, %for.inc86 ]
  %indvars.iv = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc86 ]
  %ipvt.addr.0174 = phi i32* [ %ipvt, %for.body.lr.ph ], [ %incdec.ptr88, %for.inc86 ]
  %info.0173 = phi i32 [ 0, %for.body.lr.ph ], [ %info.1, %for.inc86 ]
  %arrayidx7 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv182, !dbg !66
  %12 = load float** %arrayidx7, align 8, !dbg !66, !tbaa !57
  %add.ptr = getelementptr inbounds float* %12, i64 %indvars.iv182, !dbg !66
  tail call void @llvm.dbg.value(metadata float* %add.ptr, i64 0, metadata !33, metadata !40), !dbg !59
  %13 = sub nsw i64 %7, %indvars.iv182, !dbg !69
  %14 = trunc i64 %13 to i32, !dbg !70
  %call = tail call i32 (i32, float*, i32, ...)* bitcast (i32 (...)* @isamax to i32 (i32, float*, i32, ...)*)(i32 %14, float* %add.ptr, i32 1) #3, !dbg !70
  %15 = trunc i64 %indvars.iv182 to i32, !dbg !70
  %add = add nsw i32 %call, %15, !dbg !70
  tail call void @llvm.dbg.value(metadata i32 %add, i64 0, metadata !28, metadata !40), !dbg !71
  store i32 %add, i32* %ipvt.addr.0174, align 4, !dbg !72, !tbaa !73
  %16 = load float** %arrayidx7, align 8, !dbg !74, !tbaa !57
  %idx.ext12 = sext i32 %add to i64, !dbg !74
  %add.ptr13 = getelementptr inbounds float* %16, i64 %idx.ext12, !dbg !74
  tail call void @llvm.dbg.value(metadata float* %add.ptr13, i64 0, metadata !34, metadata !40), !dbg !75
  %17 = load float* %add.ptr13, align 4, !dbg !76, !tbaa !78
  %cmp14 = fcmp oeq float %17, 0.000000e+00, !dbg !76
  %18 = trunc i64 %indvars.iv182 to i32, !dbg !80
  br i1 %cmp14, label %for.inc86, label %if.end17, !dbg !80

if.end17:                                         ; preds = %for.body
  %cmp18 = icmp ne i32 %call, 0, !dbg !81
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !83

if.then20:                                        ; preds = %if.end17
  tail call void @llvm.dbg.value(metadata float %17, i64 0, metadata !32, metadata !40), !dbg !84
  %19 = load float* %add.ptr, align 4, !dbg !85, !tbaa !78
  store float %19, float* %add.ptr13, align 4, !dbg !87, !tbaa !78
  store float %17, float* %add.ptr, align 4, !dbg !88, !tbaa !78
  br label %if.end21, !dbg !89

if.end21:                                         ; preds = %if.then20, %if.end17
  %20 = load float* %add.ptr, align 4, !dbg !90, !tbaa !78
  %conv23 = fdiv float -1.000000e+00, %20, !dbg !91
  tail call void @llvm.dbg.value(metadata float %conv23, i64 0, metadata !32, metadata !40), !dbg !84
  %21 = add nuw nsw i64 %indvars.iv182, 1, !dbg !92
  %add.ptr.sum = add nuw nsw i64 %indvars.iv182, 1, !dbg !94
  %add.ptr25 = getelementptr inbounds float* %12, i64 %add.ptr.sum, !dbg !94
  tail call void @llvm.dbg.value(metadata float* %add.ptr25, i64 0, metadata !36, metadata !40), !dbg !95
  %cmp27161 = icmp slt i64 %21, %4, !dbg !96
  br i1 %cmp27161, label %for.body29.lr.ph, label %for.cond31.preheader, !dbg !98

for.body29.lr.ph:                                 ; preds = %if.end21
  %22 = trunc i64 %21 to i32, !dbg !98
  br label %for.body29, !dbg !98

for.cond31.preheader:                             ; preds = %for.body29, %if.end21
  %cmp32168 = icmp slt i64 %21, %6, !dbg !99
  br i1 %cmp32168, label %for.body34.lr.ph, label %for.inc86, !dbg !102

for.body34.lr.ph:                                 ; preds = %for.cond31.preheader
  %cmp73164 = icmp slt i64 %21, %5, !dbg !103
  br label %for.body34, !dbg !102

for.body29:                                       ; preds = %for.body29, %for.body29.lr.ph
  %mik.0163 = phi float* [ %add.ptr25, %for.body29.lr.ph ], [ %incdec.ptr, %for.body29 ]
  %i.0162 = phi i32 [ %22, %for.body29.lr.ph ], [ %inc, %for.body29 ]
  %23 = load float* %mik.0163, align 4, !dbg !107, !tbaa !78
  %mul = fmul float %conv23, %23, !dbg !107
  store float %mul, float* %mik.0163, align 4, !dbg !107, !tbaa !78
  %inc = add nuw nsw i32 %i.0162, 1, !dbg !108
  tail call void @llvm.dbg.value(metadata i32 %inc, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr = getelementptr inbounds float* %mik.0163, i64 1, !dbg !110
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr, i64 0, metadata !36, metadata !40), !dbg !95
  %exitcond = icmp eq i32 %i.0162, %3, !dbg !98
  br i1 %exitcond, label %for.cond31.preheader, label %for.body29, !dbg !98

for.body34:                                       ; preds = %for.inc83, %for.body34.lr.ph
  %indvars.iv178 = phi i64 [ %indvars.iv, %for.body34.lr.ph ], [ %indvars.iv.next179, %for.inc83 ]
  %arrayidx37 = getelementptr inbounds %struct.FULL* %a, i64 0, i32 2, i64 %indvars.iv178, !dbg !111
  %24 = load float** %arrayidx37, align 8, !dbg !111, !tbaa !57
  %add.ptr39 = getelementptr inbounds float* %24, i64 %indvars.iv182, !dbg !111
  %25 = load float* %add.ptr39, align 4, !dbg !111, !tbaa !78
  tail call void @llvm.dbg.value(metadata float %25, i64 0, metadata !32, metadata !40), !dbg !84
  br i1 %cmp18, label %if.then42, label %if.end63, !dbg !112

if.then42:                                        ; preds = %for.body34
  %add.ptr47 = getelementptr inbounds float* %24, i64 %idx.ext12, !dbg !113
  %26 = load float* %add.ptr47, align 4, !dbg !113, !tbaa !78
  store float %26, float* %add.ptr39, align 4, !dbg !116, !tbaa !78
  %27 = load float** %arrayidx37, align 8, !dbg !117, !tbaa !57
  %add.ptr57 = getelementptr inbounds float* %27, i64 %idx.ext12, !dbg !117
  store float %25, float* %add.ptr57, align 4, !dbg !117, !tbaa !78
  %28 = load float** %arrayidx37, align 8, !dbg !118, !tbaa !57
  %add.ptr62 = getelementptr inbounds float* %28, i64 %indvars.iv182, !dbg !118
  %29 = load float* %add.ptr62, align 4, !dbg !118, !tbaa !78
  tail call void @llvm.dbg.value(metadata float %29, i64 0, metadata !32, metadata !40), !dbg !84
  br label %if.end63, !dbg !119

if.end63:                                         ; preds = %if.then42, %for.body34
  %t.0 = phi float [ %29, %if.then42 ], [ %25, %for.body34 ]
  tail call void @llvm.dbg.value(metadata float* %add.ptr70, i64 0, metadata !35, metadata !40), !dbg !120
  tail call void @llvm.dbg.value(metadata float* %add.ptr25, i64 0, metadata !36, metadata !40), !dbg !95
  br i1 %cmp73164, label %for.body75.lr.ph, label %for.inc83, !dbg !121

for.body75.lr.ph:                                 ; preds = %if.end63
  %30 = load float** %arrayidx37, align 8, !dbg !122, !tbaa !57
  %add.ptr70 = getelementptr inbounds float* %30, i64 %add.ptr.sum, !dbg !122
  %31 = trunc i64 %21 to i32, !dbg !121
  br label %for.body75, !dbg !121

for.body75:                                       ; preds = %for.body75, %for.body75.lr.ph
  %mik.1167 = phi float* [ %add.ptr25, %for.body75.lr.ph ], [ %incdec.ptr81, %for.body75 ]
  %aij.0166 = phi float* [ %add.ptr70, %for.body75.lr.ph ], [ %incdec.ptr80, %for.body75 ]
  %i.1165 = phi i32 [ %31, %for.body75.lr.ph ], [ %inc79, %for.body75 ]
  %32 = load float* %mik.1167, align 4, !dbg !123, !tbaa !78
  %mul76 = fmul float %t.0, %32, !dbg !124
  %33 = load float* %aij.0166, align 4, !dbg !125, !tbaa !78
  %add77 = fadd float %33, %mul76, !dbg !125
  store float %add77, float* %aij.0166, align 4, !dbg !125, !tbaa !78
  %inc79 = add nuw nsw i32 %i.1165, 1, !dbg !126
  tail call void @llvm.dbg.value(metadata i32 %inc79, i64 0, metadata !25, metadata !40), !dbg !109
  %incdec.ptr80 = getelementptr inbounds float* %aij.0166, i64 1, !dbg !127
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr80, i64 0, metadata !35, metadata !40), !dbg !120
  %incdec.ptr81 = getelementptr inbounds float* %mik.1167, i64 1, !dbg !128
  tail call void @llvm.dbg.value(metadata float* %incdec.ptr81, i64 0, metadata !36, metadata !40), !dbg !95
  %exitcond177 = icmp eq i32 %i.1165, %3, !dbg !121
  br i1 %exitcond177, label %for.inc83, label %for.body75, !dbg !121

for.inc83:                                        ; preds = %for.body75, %if.end63
  %indvars.iv.next179 = add nuw nsw i64 %indvars.iv178, 1, !dbg !102
  %lftr.wideiv = trunc i64 %indvars.iv178 to i32, !dbg !102
  %exitcond181 = icmp eq i32 %lftr.wideiv, %3, !dbg !102
  br i1 %exitcond181, label %for.inc86, label %for.body34, !dbg !102

for.inc86:                                        ; preds = %for.inc83, %for.cond31.preheader, %for.body
  %info.1 = phi i32 [ %18, %for.body ], [ %info.0173, %for.cond31.preheader ], [ %info.0173, %for.inc83 ]
  %indvars.iv.next183 = add nuw nsw i64 %indvars.iv182, 1, !dbg !64
  %incdec.ptr88 = getelementptr inbounds i32* %ipvt.addr.0174, i64 1, !dbg !129
  tail call void @llvm.dbg.value(metadata i32* %incdec.ptr88, i64 0, metadata !24, metadata !40), !dbg !42
  %cmp5 = icmp slt i64 %indvars.iv.next183, %8, !dbg !130
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !64
  br i1 %cmp5, label %for.body, label %CLEAN_UP.loopexit, !dbg !64

CLEAN_UP.loopexit:                                ; preds = %for.inc86
  %scevgep = getelementptr i32* %ipvt, i64 %11
  br label %CLEAN_UP

CLEAN_UP:                                         ; preds = %CLEAN_UP.loopexit, %if.end
  %info.2 = phi i32 [ 0, %if.end ], [ %info.1, %CLEAN_UP.loopexit ]
  %ipvt.addr.1 = phi i32* [ %ipvt, %if.end ], [ %scevgep, %CLEAN_UP.loopexit ]
  %akk.1 = phi float* [ %2, %if.end ], [ %add.ptr, %CLEAN_UP.loopexit ]
  store i32 %sub, i32* %ipvt.addr.1, align 4, !dbg !131, !tbaa !73
  %34 = load float* %akk.1, align 4, !dbg !132, !tbaa !78
  %cmp91 = fcmp oeq float %34, 0.000000e+00, !dbg !132
  tail call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !30, metadata !40), !dbg !60
  %info.3 = select i1 %cmp91, i32 %0, i32 %info.2, !dbg !134
  br label %return, !dbg !134

return:                                           ; preds = %CLEAN_UP, %entry
  %retval.0 = phi i32 [ -1, %entry ], [ %info.3, %CLEAN_UP ]
  ret i32 %retval.0, !dbg !135
}

declare i32 @isamax(...) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!37, !38}
!llvm.ident = !{!39}

!0 = !{!"0x11\0012\00clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)\001\00\000\00\001", !1, !2, !2, !3, !2, !2} ; [ DW_TAG_compile_unit ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c] [DW_LANG_C99]
!1 = !{!"sgefa.c", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa"}
!2 = !{}
!3 = !{!4}
!4 = !{!"0x2e\00sgefa\00sgefa\00\0011\000\001\000\000\000\001\0048", !1, !5, !6, null, i32 (%struct.FULL*, i32*)* @sgefa, null, null, !22} ; [ DW_TAG_subprogram ] [line 11] [def] [scope 48] [sgefa]
!5 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!6 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !7, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = !{!8, !9, !21}
!8 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = !{!"0xf\00\000\0064\0064\000\000", null, null, !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FULL]
!10 = !{!"0x13\00FULL\0031\0064064\0064\000\000\000", !11, null, null, !12, null, null, null} ; [ DW_TAG_structure_type ] [FULL] [line 31, size 64064, align 64, offset 0] [def] [from ]
!11 = !{!"./ge.h", !"/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa"}
!12 = !{!13, !14, !15}
!13 = !{!"0xd\00cd\0032\0032\0032\000\000", !11, !10, !8} ; [ DW_TAG_member ] [cd] [line 32, size 32, align 32, offset 0] [from int]
!14 = !{!"0xd\00rd\0033\0032\0032\0032\000", !11, !10, !8} ; [ DW_TAG_member ] [rd] [line 33, size 32, align 32, offset 32] [from int]
!15 = !{!"0xd\00pd\0034\0064000\0064\0064\000", !11, !10, !16} ; [ DW_TAG_member ] [pd] [line 34, size 64000, align 64, offset 64] [from ]
!16 = !{!"0x1\00\000\0064000\0064\000\000\000", null, null, !17, !19, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 64000, align 64, offset 0] [from ]
!17 = !{!"0xf\00\000\0064\0064\000\000", null, null, !18} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!18 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!19 = !{!20}
!20 = !{!"0x21\000\001000"}                       ; [ DW_TAG_subrange_type ] [0, 999]
!21 = !{!"0xf\00\000\0064\0064\000\000", null, null, !8} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!22 = !{!23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36}
!23 = !{!"0x101\00a\0016777228\000", !4, !5, !9}  ; [ DW_TAG_arg_variable ] [a] [line 12]
!24 = !{!"0x101\00ipvt\0033554445\000", !4, !5, !21} ; [ DW_TAG_arg_variable ] [ipvt] [line 13]
!25 = !{!"0x100\00i\0049\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [i] [line 49]
!26 = !{!"0x100\00j\0049\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [j] [line 49]
!27 = !{!"0x100\00k\0050\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [k] [line 50]
!28 = !{!"0x100\00l\0050\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [l] [line 50]
!29 = !{!"0x100\00nm1\0050\000", !4, !5, !8}      ; [ DW_TAG_auto_variable ] [nm1] [line 50]
!30 = !{!"0x100\00info\0050\000", !4, !5, !8}     ; [ DW_TAG_auto_variable ] [info] [line 50]
!31 = !{!"0x100\00n\0050\000", !4, !5, !8}        ; [ DW_TAG_auto_variable ] [n] [line 50]
!32 = !{!"0x100\00t\0051\000", !4, !5, !18}       ; [ DW_TAG_auto_variable ] [t] [line 51]
!33 = !{!"0x100\00akk\0051\000", !4, !5, !17}     ; [ DW_TAG_auto_variable ] [akk] [line 51]
!34 = !{!"0x100\00alk\0051\000", !4, !5, !17}     ; [ DW_TAG_auto_variable ] [alk] [line 51]
!35 = !{!"0x100\00aij\0051\000", !4, !5, !17}     ; [ DW_TAG_auto_variable ] [aij] [line 51]
!36 = !{!"0x100\00mik\0051\000", !4, !5, !17}     ; [ DW_TAG_auto_variable ] [mik] [line 51]
!37 = !{i32 2, !"Dwarf Version", i32 4}
!38 = !{i32 2, !"Debug Info Version", i32 2}
!39 = !{!"clang version 3.6.0 (https://github.com/llvm-mirror/clang f06a0c83eb2f36bf182224a127ad378f42ab5094) (https://github.com/llvm-mirror/llvm 0b37b7bf52b92f9e1e7ffaff4063fd1184d2eec3)"}
!40 = !{!"0x102"}                                 ; [ DW_TAG_expression ]
!41 = !MDLocation(line: 12, column: 14, scope: !4)
!42 = !MDLocation(line: 13, column: 10, scope: !4)
!43 = !MDLocation(line: 54, column: 7, scope: !44)
!44 = !{!"0xb\0054\007\000", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!45 = !{!46, !47, i64 0}
!46 = !{!"FULL", !47, i64 0, !47, i64 4, !48, i64 8}
!47 = !{!"int", !48, i64 0}
!48 = !{!"omnipotent char", !49, i64 0}
!49 = !{!"Simple C/C++ TBAA"}
!50 = !MDLocation(line: 54, column: 16, scope: !44)
!51 = !{!46, !47, i64 4}
!52 = !MDLocation(line: 54, column: 7, scope: !4)
!53 = !MDLocation(line: 50, column: 35, scope: !4)
!54 = !MDLocation(line: 56, column: 10, scope: !4)
!55 = !MDLocation(line: 50, column: 24, scope: !4)
!56 = !MDLocation(line: 57, column: 10, scope: !4)
!57 = !{!58, !58, i64 0}
!58 = !{!"any pointer", !48, i64 0}
!59 = !MDLocation(line: 51, column: 14, scope: !4)
!60 = !MDLocation(line: 50, column: 29, scope: !4)
!61 = !MDLocation(line: 59, column: 7, scope: !62)
!62 = !{!"0xb\0059\007\001", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!63 = !MDLocation(line: 59, column: 7, scope: !4)
!64 = !MDLocation(line: 62, column: 3, scope: !65)
!65 = !{!"0xb\0062\003\002", !1, !4}              ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!66 = !MDLocation(line: 65, column: 13, scope: !67)
!67 = !{!"0xb\0062\0034\004", !1, !68}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!68 = !{!"0xb\0062\003\003", !1, !65}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!69 = !MDLocation(line: 66, column: 21, scope: !67)
!70 = !MDLocation(line: 66, column: 13, scope: !67)
!71 = !MDLocation(line: 50, column: 21, scope: !4)
!72 = !MDLocation(line: 67, column: 5, scope: !67)
!73 = !{!47, !47, i64 0}
!74 = !MDLocation(line: 70, column: 11, scope: !67)
!75 = !MDLocation(line: 51, column: 20, scope: !4)
!76 = !MDLocation(line: 71, column: 9, scope: !77)
!77 = !{!"0xb\0071\009\005", !1, !67}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!78 = !{!79, !79, i64 0}
!79 = !{!"float", !48, i64 0}
!80 = !MDLocation(line: 71, column: 9, scope: !67)
!81 = !MDLocation(line: 77, column: 9, scope: !82)
!82 = !{!"0xb\0077\009\007", !1, !67}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!83 = !MDLocation(line: 77, column: 9, scope: !67)
!84 = !MDLocation(line: 51, column: 10, scope: !4)
!85 = !MDLocation(line: 79, column: 14, scope: !86)
!86 = !{!"0xb\0077\0018\008", !1, !82}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!87 = !MDLocation(line: 79, column: 7, scope: !86)
!88 = !MDLocation(line: 80, column: 7, scope: !86)
!89 = !MDLocation(line: 81, column: 5, scope: !86)
!90 = !MDLocation(line: 84, column: 19, scope: !67)
!91 = !MDLocation(line: 84, column: 9, scope: !67)
!92 = !MDLocation(line: 85, column: 12, scope: !93)
!93 = !{!"0xb\0085\005\009", !1, !67}             ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!94 = !MDLocation(line: 85, column: 23, scope: !93)
!95 = !MDLocation(line: 51, column: 32, scope: !4)
!96 = !MDLocation(line: 85, column: 30, scope: !97)
!97 = !{!"0xb\0085\005\0010", !1, !93}            ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!98 = !MDLocation(line: 85, column: 5, scope: !93)
!99 = !MDLocation(line: 89, column: 17, scope: !100)
!100 = !{!"0xb\0089\005\0012", !1, !101}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!101 = !{!"0xb\0089\005\0011", !1, !67}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!102 = !MDLocation(line: 89, column: 5, scope: !101)
!103 = !MDLocation(line: 98, column: 48, scope: !104)
!104 = !{!"0xb\0098\007\0017", !1, !105}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!105 = !{!"0xb\0098\007\0016", !1, !106}          ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!106 = !{!"0xb\0089\0028\0013", !1, !100}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!107 = !MDLocation(line: 86, column: 7, scope: !97)
!108 = !MDLocation(line: 85, column: 35, scope: !97)
!109 = !MDLocation(line: 49, column: 17, scope: !4)
!110 = !MDLocation(line: 85, column: 40, scope: !97)
!111 = !MDLocation(line: 92, column: 11, scope: !106)
!112 = !MDLocation(line: 93, column: 11, scope: !106)
!113 = !MDLocation(line: 94, column: 17, scope: !114)
!114 = !{!"0xb\0093\0020\0015", !1, !115}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!115 = !{!"0xb\0093\0011\0014", !1, !106}         ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!116 = !MDLocation(line: 94, column: 2, scope: !114)
!117 = !MDLocation(line: 95, column: 2, scope: !114)
!118 = !MDLocation(line: 96, column: 6, scope: !114)
!119 = !MDLocation(line: 97, column: 7, scope: !114)
!120 = !MDLocation(line: 51, column: 26, scope: !4)
!121 = !MDLocation(line: 98, column: 7, scope: !105)
!122 = !MDLocation(line: 98, column: 23, scope: !105)
!123 = !MDLocation(line: 99, column: 13, scope: !104)
!124 = !MDLocation(line: 99, column: 10, scope: !104)
!125 = !MDLocation(line: 99, column: 2, scope: !104)
!126 = !MDLocation(line: 98, column: 53, scope: !104)
!127 = !MDLocation(line: 98, column: 58, scope: !104)
!128 = !MDLocation(line: 98, column: 65, scope: !104)
!129 = !MDLocation(line: 62, column: 25, scope: !68)
!130 = !MDLocation(line: 62, column: 13, scope: !68)
!131 = !MDLocation(line: 104, column: 3, scope: !4)
!132 = !MDLocation(line: 105, column: 7, scope: !133)
!133 = !{!"0xb\00105\007\0018", !1, !4}           ; [ DW_TAG_lexical_block ] [/home/vanderson/dev/repos/GEOS1.0/GEOS/experiments/benchmarks/src/sgefa/sgefa.c]
!134 = !MDLocation(line: 105, column: 7, scope: !4)
!135 = !MDLocation(line: 107, column: 1, scope: !4)
